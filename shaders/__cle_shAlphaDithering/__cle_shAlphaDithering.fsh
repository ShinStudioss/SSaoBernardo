
precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_bayerTexture;
uniform vec4 u_bayerUVs;
uniform float u_bayerSize;
uniform float u_threshold;

void main() {
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
	DoAlphaTest(col);
	if (col.a < u_threshold) { // everything above is opaque and has no dithering
		vec2 uvDither = mod(gl_FragCoord.xy, u_bayerSize) / u_bayerSize;
		uvDither = mix(u_bayerUVs.xy, u_bayerUVs.zw, uvDither);
		if ((col.a/u_threshold) < texture2D(u_bayerTexture, uvDither).r) discard;
	}
	gl_FragColor = col;
}
