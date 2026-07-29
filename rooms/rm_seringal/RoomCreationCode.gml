if !instance_exists(obj_jogador){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_jogador)
}

if !instance_exists(obj_controladorDoJogo){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_controladorDoJogo)
}

else{
	obj_jogador.x = global.transitionX
	obj_jogador.y = global.transitionY obj_controladorDoJogo.transitionGoal = 0
}

