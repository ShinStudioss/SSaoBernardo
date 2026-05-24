
precision highp float;

#define ENABLE_H_FLIP // Flip horizontally when light is below (helps with sprite projection)
#define ENABLE_V_FLIP // Flip vertically if followLightAngle is false and the light is above

// from ShadowCaster
attribute vec4 in_Colour; // positionXY, depth, fixedBase
attribute vec4 in_Colour2; // texCoordXY, localSizeXY
attribute vec4 in_Colour3; // shadowLength, followLightAngle, angle (radians), fixedBase2

// from light
uniform vec2 u_params; // shadowScattering, alpha
uniform vec3 u_params2; // 2d light position, shadowDepthOffset

varying vec2 v_vTexcoord;
varying float v_vAlpha;

void main() {
	// Copyright (C) 2025 Mozart Junior (@foxyofjungle)
	float shadowLen = in_Colour3.x + u_params.x;
	vec2 lightDist = in_Colour.xy - u_params2.xy;
	vec2 lightDir = normalize(lightDist);
	
	float angle = in_Colour3.z;
	vec2 size = in_Colour2.zw;
	float cosA = cos(angle);
	float sinA = sin(angle);
	
	if (in_Colour3.y > 0.5) {
		cosA = -lightDir.y;
		sinA = lightDir.x;
		#ifdef ENABLE_H_FLIP
			float flip = -sign(lightDist.y);
			if (flip != 0.0) size.x *= flip;
		#endif
	} else {
		#ifdef ENABLE_V_FLIP
			if (in_Colour3.w > 0.5) {
				size.y *= -sign(lightDist.y);
			}
		#endif
	}
	
	mat2 rot = mat2(cosA, -sinA, sinA, cosA);
	vec2 shadowPos = (in_Colour.xy + size * rot) + (lightDist*shadowLen*in_Colour.w);
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(shadowPos, in_Colour.z+u_params2.z, 1.0);
	v_vTexcoord = in_Colour2.xy;
	v_vAlpha = u_params.y;
}
