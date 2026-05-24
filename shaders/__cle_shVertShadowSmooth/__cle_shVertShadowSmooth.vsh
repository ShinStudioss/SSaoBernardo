
precision highp float;

// from ShadowCaster
attribute vec4 in_Colour; // positionXY, depth, farZ
attribute vec4 in_Colour2; // texCoordXY, shadowLength, penumbraOffset

// from light
uniform vec4 u_params; // shadowScattering, shadowAlpha, shadowPenumbra, shadowUmbra
uniform vec4 u_params2; // 2d light position, shadowDepthOffset, lightPenetration

varying vec2 v_vTexcoord;
varying float v_vFalloffUf;
varying float v_vFalloffPf;
varying float v_vAlpha;

void main() {
	// (C) 2025, Mozart Junior (@foxyofjungle) (https://foxyofjungle.itch.io/)
	// Inspired by Slembcke (https://slembcke.github.io/SuperFastSoftShadows)
	float shadowLen = in_Colour2.z + u_params.x;
	vec2 lightDir = in_Colour.xy - u_params2.xy;
	vec2 shadowPos = in_Colour.xy + (in_Colour.w*lightDir + normalize(vec2(lightDir.y, -lightDir.x))*in_Colour2.w*u_params.z) * shadowLen;
	
	float projDist = length((in_Colour.xy+in_Colour.w) - in_Colour.xy); // proj - pos
	v_vFalloffUf = projDist * u_params.w;
	v_vFalloffPf = projDist / (u_params2.w / shadowLen);
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(shadowPos, in_Colour.z+u_params2.z, 1.0);
	v_vTexcoord = in_Colour2.xy;
	v_vAlpha = u_params.y;
}
