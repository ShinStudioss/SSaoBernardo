
/*------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Only compiled binary executables. Don't remove this notice, please.
Copyright (C) 2025 Mozart Junior (FoxyOfJungle). Kazan Games Ltd.
Website: https://foxyofjungle.itch.io/ | Discord: @foxyofjungle
-------------------------------------------------------------------*/

precision highp float;

// Prefs (for optimization, comment the definition)
#define ENABLE_DITHERING
#define ENABLE_AMBIENT_LUT
#define ENABLE_MATERIALS
//#define ADDITIVE_EMISSION

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;

uniform vec2 u_resolution;
uniform vec4 u_camRect;
uniform vec3 u_ambientColor;
uniform sampler2D u_ambientColorLutTex;
uniform vec2 u_ambientColorLUTsize;
uniform vec2 u_ambientColorLUTtiles;
uniform vec4 u_ambientColorLutUVs;
uniform float u_ambientColorIsOverlay;
uniform float u_ambientIntensity;
uniform sampler2D u_materialTexture;
uniform sampler2D u_lightsTexture;
uniform float u_lightsIntensity;
uniform float u_lightsCompensation;
uniform int u_lightsBlendMode;
uniform sampler2D u_emissiveTexture;
uniform float u_ditheringEnable;
uniform float u_ditheringBayerSize;
uniform sampler2D u_ditheringBayerTexture;
uniform vec4 u_ditheringBayerUVs;
uniform float u_ditheringBitLevels;
uniform float u_ditheringThreshold;

#region Common

float Saturate(float x) {
	return clamp(x, 0.0, 1.0);
}

vec2 Saturate(vec2 x) {
	return clamp(x, 0.0, 1.0);
}

vec3 Saturate(vec3 x) {
	return clamp(x, 0.0, 1.0);
}

vec4 Saturate(vec4 x) {
	return clamp(x, 0.0, 1.0);
}

const float YRGB_EPSILON = 1e-6;

vec3 RGBtoHCV(in vec3 rgb) {
	// RGB [0..1] to Hue-Chroma-Value [0..1]
	// Based on work by Sam Hocevar and Emil Persson
	vec4 p = (rgb.g < rgb.b) ? vec4(rgb.bg, -1., 2. / 3.) : vec4(rgb.gb, 0., -1. / 3.);
	vec4 q = (rgb.r < p.x) ? vec4(p.xyw, rgb.r) : vec4(rgb.r, p.yzx);
	float c = q.x - min(q.w, q.y);
	float h = abs((q.w - q.y) / (6. * c + YRGB_EPSILON) + q.z);
	return vec3(h, c, q.x);
}

vec3 RGBtoHSV(in vec3 rgb) {
	// RGB [0..1] to Hue-Saturation-Value [0..1]
	vec3 hcv = RGBtoHCV(rgb);
	float s = hcv.y / (hcv.z + YRGB_EPSILON);
	return vec3(hcv.x, s, hcv.z);
}

vec3 ApplyLUT(vec3 color) {
	// Copyright (C) 2025, Mozart Junior (@foxyofjungle)
	vec2 tiles = u_ambientColorLUTtiles;
	float z = Saturate(color.b) * (tiles.x * tiles.y - 1.0);
	float z1 = floor(z);
	float z2 = ceil(z);
	vec2 tile1;
		tile1.y = floor(z1 / tiles.x);
		tile1.x = floor(z1 - tile1.y * tiles.x);
	vec2 tile2;
		tile2.y = floor(z2 / tiles.x);
		tile2.x = floor(z2 - tile2.y * tiles.x);
	vec2 tileSize = u_ambientColorLUTsize / tiles;
	vec2 tileUV = mix(0.5/tileSize, (tileSize-0.5)/tileSize, Saturate(color.rg));
	return mix(
		texture2D(u_ambientColorLutTex, mix(u_ambientColorLutUVs.xy, u_ambientColorLutUVs.zw, (tile1/tiles)+(tileUV/tiles))).rgb,
		texture2D(u_ambientColorLutTex, mix(u_ambientColorLutUVs.xy, u_ambientColorLutUVs.zw, (tile2/tiles)+(tileUV/tiles))).rgb,
		z-z1 // frac
	);
}

vec3 simpleReinhardToneMapping(vec3 color) {
	float exposure = 1.0;
	color *= exposure / (1. + color / exposure);
	return color;
}

vec3 whitePreservingLumaBasedReinhardToneMapping(vec3 color) {
	float white = 2.;
	float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
	float toneMappedLuma = luma * (1.0 + luma / (white*white)) / (1.0 + luma);
	color *= toneMappedLuma / luma;
	return max(color, 0.0);
}

//vec3 textureBlur(sampler2D tex, vec2 uv, float amount) {
//	vec2 radius = vec2(1.0/u_resolution) * amount;
//	vec3 blur = vec3(0.0);
//	float total = 0.0;
//	for(float i = 0.0; i < 64.0; i+=2.39996323) {
//		blur += texture2D(tex, v_vTexcoord + vec2(cos(i), sin(i)) * sqrt(i) * radius).rgb;
//		total++;
//	}
//	return blur / total;
//}

#endregion

void main() {
	vec4 albedoTex = texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 colFinal = albedoTex.rgb;
	
	#ifdef ENABLE_MATERIALS
		// Ambient occlusion
		colFinal *= texture2D(u_materialTexture, v_vTexcoord).b;
	#endif
	
	// Ambient color
	#ifdef ENABLE_AMBIENT_LUT
		colFinal = ApplyLUT(colFinal);
	#endif
	colFinal = mix(colFinal, (u_ambientColorIsOverlay > 0.5) ? u_ambientColor : colFinal*u_ambientColor, u_ambientIntensity);
	
	// Lights (alpha is irrelevant, because lights are additive)
	vec3 lightsCol = max(texture2D(u_lightsTexture, v_vTexcoord).rgb, 0.0) * u_lightsIntensity;
	// < add different effects to all lights and shadows here >
	
	// Dithering
	#ifdef ENABLE_DITHERING
		if (u_ditheringEnable > 0.5) {
			vec2 uvDither = mod(v_vPosition.xy+u_camRect.xy, u_ditheringBayerSize) / u_ditheringBayerSize;
			uvDither = mix(u_ditheringBayerUVs.xy, u_ditheringBayerUVs.zw, uvDither); // atlas uv
			float matrix = texture2D(u_ditheringBayerTexture, uvDither).r;
			lightsCol *= step(max(matrix-u_ditheringThreshold, 0.0), RGBtoHSV(lightsCol).z);
		}
	#endif
	
	// Blend Lights
	if (u_lightsBlendMode == 0) {
		// multiply (natural)
		colFinal += (lightsCol*albedoTex.rgb) * u_lightsCompensation;
	} else
	if (u_lightsBlendMode == 1) {
		// multiply (reinhard LDR)
		colFinal += whitePreservingLumaBasedReinhardToneMapping(lightsCol*albedoTex.rgb * u_lightsCompensation);
	} else
	if (u_lightsBlendMode == 2) {
		// normalized multiply
		colFinal = mix(colFinal, (normalize(lightsCol + 0.05)*u_lightsCompensation)*albedoTex.rgb, lightsCol);
	} else
	if (u_lightsBlendMode == 3) {
		// add
		colFinal += lightsCol;
	}
	
	#ifdef ENABLE_MATERIALS
		// Blend Emissive with HDR support
		vec3 emissiveCol = texture2D(u_emissiveTexture, v_vTexcoord).rgb;
		#ifdef ADDITIVE_EMISSION
		colFinal += emissiveCol;
		#else
		colFinal = mix(colFinal, emissiveCol, emissiveCol); // linear interpolation looks more natural and colorful
		#endif
	#endif
	
	// Final pixels
	colFinal = max(colFinal, 0.0); // prevent negative output
	gl_FragColor = vec4(colFinal, 1.0);
}
