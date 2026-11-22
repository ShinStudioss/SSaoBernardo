event_inherited()

if (global.pause) exit
if (!instance_exists(obj_jogador)) exit

var _distancia = point_distance(x, y, obj_jogador.x, obj_jogador.y)
var _noChao = place_meeting(x, y + 1, obj_colisor)

// Sofrendo knockback ou parado depois do dano: não persegue
var _atordoado = (knockbackTempo > 0 or tempoParado > 0)

if (_atordoado){
}
else if (_distancia <= alcanceVisao and abs(obj_jogador.x - x) > 4){
	// Persegue o jogador
	dir = sign(obj_jogador.x - x)
	var _vel = velocidade * dir

	if (!place_meeting(x + _vel, y, obj_colisor)){
		x += _vel
	}
	else{
		// Encosta na parede e pula para tentar passar
		while (!place_meeting(x + sign(_vel), y, obj_colisor)){
			x += sign(_vel)
		}
		if (_noChao){
			jumpSpeed = forcaPulo
		}
	}
}

// Vira o sprite para o lado do movimento
image_xscale = dir 