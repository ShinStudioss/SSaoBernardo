if pickable = true{
	audio_play_sound(snd_equipe,4,0)
	audio_play_sound(snd_porongaApagando,0,0,,,0.7)
	scr_freeze(60)
	instance_destroy()
}