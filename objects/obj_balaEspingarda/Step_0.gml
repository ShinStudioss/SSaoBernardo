image_xscale = random_range(0.4,0.8)
image_yscale = image_xscale
image_index = 0

if alarm[0] <= 0{
	image_alpha -= 0.1
}

if image_alpha <= 0{
	instance_destroy()
}