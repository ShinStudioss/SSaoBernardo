audio_play_sound(snd_pop,5,0)
instance_create_depth(96,600,depth-1,obj_borrachaLoja)
if scr_buscarItem(7) != noone{
	alarm[1] = clamp(5 *scr_buscarItem(7).quantidade,2,20)
	scr_removerItem(7,1)
}