if !instance_exists(obj_jogador){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_jogador)
}
else{
	obj_jogador.x = room_width/2
	obj_jogador.y = 416
}

hora = 15
global.horaAlvo = 19
