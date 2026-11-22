if (global.pause) exit

image_angle += 10 * sign(hsp)

if (!rebatida){
	// ---- Voo normal (arco com gravidade) ----
	vsp += gravidade
	x += hsp
	y += vsp

	// Bateu no cenário
	if (place_meeting(x, y, obj_colisor)){
		scr_explosaoParticula(x, y, depth + 1, 360, 8, spr_particulaGrama, 5, 0.05, 0.1)
		instance_destroy()
		exit
	}

	// Acertou o jogador
	if (place_meeting(x, y, obj_jogador)){
		if obj_jogador.sprite_index = spr_jogadorAtacando{
			rebatida = true
		}else{
			scr_Dano(dano, 10)
			instance_destroy()
			exit
		}
	}
}
else{
	// ---- Rebatida: vai direto para o macaco, ignorando colisões ----
	if (!instance_exists(dono)){
		instance_destroy()
		exit
	}

	var _ang = point_direction(x, y, dono.x, dono.y)
	x += lengthdir_x(velRebatida, _ang)
	y += lengthdir_y(velRebatida, _ang)

	// Acertou o macaco
	if (place_meeting(x, y, dono) or point_distance(x, y, dono.x, dono.y) < 16){
		dono.receber_dano(1, sign(dono.x - x))
		instance_destroy()
	}
}

// Saiu muito longe da sala
if (x < -200 or x > room_width + 200 or y > room_height + 200){
	instance_destroy()
}