keybinds = scr_getBinds()

if lojista{
	if obj_barracao.lojaEstado = 2{
		
	}
}

if sprite_index = spr_lojistamangando{
	if audio_is_playing(snd_sosoRisada){
		if image_index >= 5 and !audio_is_playing(snd_sosoPancada){
			audio_play_sound(snd_sosoPancada,8,0)
		}
	}
	else{
		sprite_index = spr_lojista
		alarm[0] = 90
	}
}
	

global.pause = true