obj_controladorDoJogo.larguraCamAlvo = 1152 
obj_controladorDoJogo.alturaCamAlvo = 648

if instance_exists(obj_jogador){
	if obj_jogador.tercoDialogo = id{
		audio_group_set_gain(audiogroup_default,global.sfxVolume,1)
		audio_group_set_gain(audiogroup_ost,global.ostVolume,1)
		scr_freeze(180)
		obj_controladorDoJogo.flash = 1
		obj_jogador.effectColor = [0,255,0]
		obj_controladorDoJogo.alarm[0] = 3
		audio_play_sound(snd_terco,9,0)
		global.saude = global.saudeMax
		global.pause = false
		obj_jogador.idleSprite = spr_jogadorParado
		obj_jogador.sprite_index = spr_jogadorParado
		scr_explosaoParticula(obj_jogador.x,obj_jogador.y,depth+1,360,10,spr_particulaBrilho,13+random_range(-2,2),0.05,0.3)
		obj_jogador.tercoDialogo = 0
	}
}

if obj_dayControl.dialogo = id{
	audio_play_sound(snd_riser,8,0)
	obj_dayControl.alarm[1] = 130
}