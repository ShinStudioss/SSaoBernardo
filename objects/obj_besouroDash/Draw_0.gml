// Pisca em branco nos bipes de aviso
if (flashBranco){
	gpu_set_fog(true, c_white, 0, 1)
	draw_self()
	gpu_set_fog(false, c_white, 0, 1)
}
else{
	draw_self()
}