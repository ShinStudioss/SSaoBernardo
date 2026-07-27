if pickable = false{
	scr_freeze(40)
	scr_explosaoParticula(x,y,depth-1,360,8,spr_particulaBagaco,6,0.03,0.1)
	audio_play_sound(snd_hitTerra,5,0,,,0.6)
	pickable = true
}