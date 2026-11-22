event_inherited()

if (global.pause) exit
if (!instance_exists(obj_jogador)) exit

var _distancia = point_distance(x, y, obj_jogador.x, obj_jogador.y)
var _noChao = place_meeting(x, y + 1, obj_colisor)

// Sofrendo knockback ou parada depois do dano: cancela o salto
var _atordoada = (knockbackTempo > 0 or tempoParado > 0)

if (_atordoada){
	hSpeedPulo = 0
	timerPulo = tempoEntrePulos
	image_xscale = dir
	exit
}

if (_noChao){
	// ---- No chão: espera e salta em direção ao jogador ----
	hSpeedPulo = 0
	sprite_index = spr_aranhaParada

	if (_distancia <= alcanceVisao and abs(obj_jogador.x - x) > 4){
		dir = sign(obj_jogador.x - x)

		timerPulo--
		if (timerPulo <= 0){
			jumpSpeed = forcaPulo
			hSpeedPulo = velocidade * dir
			timerPulo = tempoEntrePulos
		}
	}
}
else{
	// ---- No ar: avança na direção do salto ----
	if (hSpeedPulo != 0){
		if (!place_meeting(x + hSpeedPulo, y, obj_colisor)){
			x += hSpeedPulo
		}
		else{
			// Bateu na parede: encosta e cai reto
			while (!place_meeting(x + sign(hSpeedPulo), y, obj_colisor)){
				x += sign(hSpeedPulo)
			}
			hSpeedPulo = 0
		}
	}
}

// Vira o sprite para o lado do movimento
image_xscale = dir