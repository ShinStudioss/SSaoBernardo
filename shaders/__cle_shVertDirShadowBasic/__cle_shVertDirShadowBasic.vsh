
precision highp float;

// from ShadowCaster
attribute vec4 in_Colour; // positionXY, depth, farZ
attribute vec4 in_Colour2; // texCoordXY, shadowLength, penumbraOffset

// from light
uniform vec2 u_params; // shadowScattering, shadowAlpha
uniform vec3 u_params2; // xDir, yDir, shadowDepthOffset

varying float v_vAlpha;

void main() {
	// (C) 2025, Mozart Junior (@foxyofjungle) (https://foxyofjungle.itch.io/)
	// Inspired by Slembcke (https://slembcke.github.io/SuperFastSoftShadows)
	float shadowLen = in_Colour2.z + u_params.x;
	vec2 shadowPos = in_Colour.xy + (in_Colour.w*u_params2.xy*shadowLen);
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(shadowPos, in_Colour.z+u_params2.z, 1.0);
	v_vAlpha = u_params.y;
}
