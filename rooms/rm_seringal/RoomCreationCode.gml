if !instance_exists(obj_jogador){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_jogador)
}
else{
	obj_jogador.x = global.transitionX
	obj_jogador.y = global.transitionY
}

