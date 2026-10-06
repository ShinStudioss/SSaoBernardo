keybinds = scr_getBinds()

if sprite_index = spr_lojistamangando{
	if audio_is_playing(snd_sosoRisada){
		if image_index >= 5 and !audio_is_playing(snd_sosoPancada){
			audio_play_sound(snd_sosoPancada,8,0)
		}
	}
	else{
		sprite_index = spr_lojista
		alarm[0] = 30
	}
}	

global.pause = true

escala = lerp(escala,1,0.2)
rotacao = lerp(rotacao,0,0.2)
cor = merge_colour(cor,c_white,0.2)
if shake > 0{
	shake --
}