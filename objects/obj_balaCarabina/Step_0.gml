image_index = sign(obj_jogador.xScaleReal)

if alarm[0] <= 0{
	image_alpha -= 0.1
}

if image_alpha <= 0{
	instance_destroy()
}

// Inherit the parent event
event_inherited();
if (global.hora > 18 and global.hora < 23) or (global.hora > 00 and global.hora < 5){
}
else{
	intensity = 0.4
	radius = 32
}
