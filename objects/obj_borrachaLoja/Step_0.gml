if deleteRoad = false{
image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
speed = lerp(speed,0,0.05)
}
else{
	x = lerp(x,1826,0.05)
	y = lerp(y,600,0.05)
}
image_index = 7

if x >= 1300{
	instance_destroy()
}