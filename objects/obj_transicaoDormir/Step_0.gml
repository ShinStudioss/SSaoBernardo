if (fade_state == "in") {
	global.pause = true
	image_alpha += fade_speed
	
	if (image_alpha >= 2.5) {
		image_alpha = 2.5
		fade_state = "out"
		if (global.daytime == "noite") {
			global.daytime = "dia"
		}
		else {
			global.daytime = "noite"
		}
		if (obj_dialogBox) {
			instance_destroy(obj_dialogBox)
		}
	}
}
else {
	image_alpha -= fade_speed
	if (image_alpha <= 0) {
		global.pause = false
        instance_destroy();
    }
}