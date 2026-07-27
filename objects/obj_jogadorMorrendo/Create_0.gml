x = obj_jogador.x 
y = obj_jogador.y 
image_xscale = sign(obj_jogador.xScaleReal)

hsp = moveSpeed * speedMulti * image_xscale
vsp = -4;

gravidade = 0.4;
quique = 0.18;

audio_play_sound(snd_morte,0,0)

audio_group_set_gain(audiogroup_default,global.sfxVolume,0)

scr_freeze(200)
