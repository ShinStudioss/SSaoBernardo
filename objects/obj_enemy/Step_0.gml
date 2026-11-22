if (global.pause) exit

// ---- Invulnerabilidade: pisca e depois volta ao normal ----
if (invulneravel){
	tempoInvul--
	image_alpha = ((tempoInvul div 4) mod 2 == 0) ? 0.3 : 1

	if (tempoInvul <= 0){
		invulneravel = false
		image_alpha = 1
	}
}

// ---- Knockback (velocidade do inimigo, respeitando colisões) ----
if (knockbackTempo > 0){
	var _kb = velocidade * knockbackDir

	if (!place_meeting(x + _kb, y, obj_colisor)){
		x += _kb
	}
	else{
		// Encosta na parede e cancela o knockback
		while (!place_meeting(x + sign(_kb), y, obj_colisor)){
			x += sign(_kb)
		}
		knockbackTempo = 0
	}

	knockbackTempo--
}
else{
	// Depois do knockback, conta o tempo parado
	if (tempoParado > 0) tempoParado--
}

// ---- Gravidade ----
if (!place_meeting(x, y + 1, obj_colisor)){
	if (jumpSpeed <= maxjumpspeed){
		jumpSpeed += gravidade
	}
}

// ---- Colisão vertical ----
if (place_meeting(x, y + jumpSpeed, obj_colisor)){
	while (!place_meeting(x, y + sign(jumpSpeed), obj_colisor)){
		y += sign(jumpSpeed)
	}
	jumpSpeed = 0
}

y += jumpSpeed

// ---- Causar dano no jogador ----
if (cooldownDano > 0) cooldownDano--

if (cooldownDano <= 0 and place_meeting(x, y, obj_jogador)){
	scr_Dano(dano,10)
}