function scr_Dano(valor, knockback){
	if obj_jogador.invencivel = false and global.pause = false{
		obj_jogador.xScaleReal = 2
		obj_jogador.effectColor = [255,0,0]
		scr_freeze(120)
		scr_cameraShake(30)
		obj_controladorDoJogo.vinhetaVermelha = 1
		
		audio_play_sound(snd_dano,0,0)
		global.saude -= valor
		obj_jogador.recoil = knockback * sign(obj_jogador.x - x)
		
		obj_jogador.alarm[9] = 60
		obj_jogador.invencivel = true
	}
}
