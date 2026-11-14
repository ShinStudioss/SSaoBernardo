if !instance_exists(obj_controladorDoJogo){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_controladorDoJogo)
}

if !instance_exists(obj_dayControl){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_dayControl)
}
else{
	obj_jogador.x = global.transitionX
	obj_jogador.y = global.transitionY 
	obj_controladorDoJogo.transitionGoal = 0
}
audio_sound_gain(snd_ambiente,0,3000)

