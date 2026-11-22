vida = 3
dano = 1

// Velocidade do inimigo (o knockback usa esse mesmo valor)
velocidade = 1

// Invulnerabilidade
invulneravel = false
tempoInvul = 0
tempoInvulMax = 60

// Cooldown do dano no jogador
cooldownDano = 0
cooldownDanoMax = 60

// Física
gravidade = 0.4
jumpSpeed = 0
maxjumpspeed = 30

// Knockback: empurra na velocidade do inimigo por alguns frames
knockbackTempo = 0
knockbackDir = 0
duracaoKnockback = 10

// Fica parado depois de tomar dano
tempoParado = 0
tempoParadoMax = 45

// Partículas ao tomar dano (cada filho pode trocar o sprite)
spriteParticulaDano = spr_particulaSangue

// _dirKB = direção do empurrão (-1 ou 1)
receber_dano = function(_dano, _dirKB){
	if (invulneravel) exit

	vida -= _dano
	invulneravel = true
	tempoInvul = tempoInvulMax

	// Knockback na velocidade do inimigo
	knockbackDir = _dirKB
	knockbackTempo = duracaoKnockback

	// Depois do knockback, fica parado
	tempoParado = tempoParadoMax

	// Partículas ao tomar dano
	jumpSpeed = -3
	scr_freeze(40)
	scr_cameraShake(10)
	audio_play_sound(snd_corte,5,0,,,random_range(0.9,1.2))
	scr_explosaoParticula(x, y, depth + 1, 360, 12, spr_particulaSangue, 5, 0.03, 0.05)
	scr_explosaoParticula(x, y, depth + 1, 360, 12, spr_particulaSangue, 8, 0.03, 0.05)

	if (vida <= 0){
		instance_destroy()
	}
}