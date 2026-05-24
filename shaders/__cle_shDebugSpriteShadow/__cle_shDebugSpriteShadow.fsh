
uniform vec3 u_color;
varying vec2 v_vTexcoord;

void main() {
    gl_FragColor = vec4(u_color.xyz, 0.5);
}
