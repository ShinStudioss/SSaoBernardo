
varying vec2 v_vTexcoord;
varying float v_vAlpha;

void main() {
	gl_FragColor = vec4(0.0, 0.0, 0.0, texture2D(gm_BaseTexture, v_vTexcoord).a*v_vAlpha);
}
