if distance_to_object(obj_jogador) < random_range(100,130) and state = "parado"{
	var som = choose(snd_arara1,snd_arara2)
	audio_play_sound(som,10,0,,,random_range(0.9,1.3))
	audio_play_sound(snd_araraVoando,9,,,random_range(0.9,1.3))
	state = "voando"
}

if state = "parado"{
	x = lerp(x,alvoX,0.3)
	y = lerp(y,ystart,0.3)
}

else{
	image_xscale = sign(x - obj_jogador.x)
	sprite_index = spr_araraVoando
	x += random_range(6,9)
	y -= random_range(6,9)
}

if y < 0 {
	instance_destroy()
}
//Shape (ausente)