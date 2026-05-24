
attribute vec4 in_Colour; // positionXY, depth, fixedBase
attribute vec4 in_Colour2; // texCoordXY, localSizeXY
attribute vec3 in_Colour3; // shadowLength, followLightAngle, angle (radians)

void main() {
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Colour.xy+in_Colour2.zw, 0.0, 1.0);
}
