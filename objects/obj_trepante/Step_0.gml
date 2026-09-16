if (place_meeting(x, y, obj_jogador)){
    obj_jogador.podeTrepar = true;
	if obj_jogador.trepando = true and estica = true{
		var _esticada = lerp(image_yscale,escalay+0.25,0.2)
		image_yscale = _esticada
	}
}
depth = obj_jogador.depth + 1
image_xscale = lerp(image_xscale,1,0.2)
image_yscale = lerp(image_yscale,escalay,0.2)