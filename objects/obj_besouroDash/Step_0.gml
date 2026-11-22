event_inherited()

if (global.pause) exit
if (!instance_exists(obj_jogador)) exit

// ---- Controle do flash branco ----
if (flashTimer > 0){
	flashTimer--
	if (flashTimer <= 0) flashBranco = false
}

// ---- Tomou dano (knockback ou parado): cancela o ataque ----
var _atordoado = (knockbackTempo > 0 or tempoParado > 0)

if (_atordoado){
	estado = "parado"
	tempoEspera = tempoEsperaMax
	flashBranco = false
	flashTimer = 0
	exit
}

var _distancia = point_distance(x, y, obj_jogador.x, obj_jogador.y)

switch (estado){

	// -------------------------------------------------------------
	case "parado":

		// Olha para o jogador
		if (abs(obj_jogador.x - x) > 4){
			dir = sign(obj_jogador.x - x)
		}

		if (_distancia <= alcanceVisao){
			tempoEspera--
			if (tempoEspera <= 0){
				estado = "aviso"
				avisoIndex = 0
				avisoTimer = intervalosAviso[0]
			}
		}
	break;

	// -------------------------------------------------------------
	case "aviso":

		// Continua olhando para o jogador enquanto pisca
		if (abs(obj_jogador.x - x) > 4){
			dir = sign(obj_jogador.x - x)
		}

		avisoTimer--
		if (avisoTimer <= 0){

			if (avisoIndex < 3){
				// Bipe: pisca em branco
				flashBranco = true
				flashTimer = duracaoFlash
				avisoIndex++
				avisoTimer = intervalosAviso[avisoIndex]
			}
			else{
				// Terminou os 3 bipes: dasha na direção do jogador
				estado = "dash"
				dashDir = sign(obj_jogador.x - x)
				if (dashDir == 0) dashDir = dir
				dir = dashDir
				dashTimer = dashDuracao
			}
		}
	break;

	// -------------------------------------------------------------
	case "dash":
		var _v = dashVel * dashDir

		if (!place_meeting(x + _v, y, obj_colisor)){
			x += _v
		}
		else{
			// Bateu na parede: encosta e termina o dash
			while (!place_meeting(x + sign(_v), y, obj_colisor)){
				x += sign(_v)
			}
			dashTimer = 0
		}

		dashTimer--
		if (dashTimer <= 0){
			estado = "parado"
			tempoEspera = tempoEsperaMax
		}
	break;
}

// Vira o sprite para o lado do movimento
image_xscale = dir