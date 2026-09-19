if !instance_exists(obj_jogador){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_jogador)
}

if !instance_exists(obj_controladorDoJogo){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_controladorDoJogo)
}

else{
	obj_jogador.x = -30
	obj_jogador.y = 514
	obj_controladorDoJogo.transitionGoal = 0
}
