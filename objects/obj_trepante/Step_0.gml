if (place_meeting(x, y, obj_jogador)){
    obj_jogador.podeTrepar = true;
	if obj_jogador.trepando = true{
		image_yscale = escalay + 1
	}
}
keybinds = scr_getBinds()
depth = obj_jogador.depth + 1
if obj_jogador.trepando = true{
	if !keyboard_check(keybinds.up) or !keyboard_check(keybinds.down){
		image_speed = 0
	}else{
		if keyboard_check(keybinds.up){
			image_speed = 1
		}
		if keyboard_check(keybinds.down){
			image_speed = -1
		}
	}
}

image_xscale = lerp(image_xscale,1,0.2)
image_yscale = lerp(image_yscale,escalay,0.2)