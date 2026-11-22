if !instance_exists(obj_jogador){
	instance_create_layer(room_width/2,room_height/2,"lay_instances",obj_jogador)
}
else{
	obj_jogador.x = room_width/2
	obj_jogador.y = 416
}


global.horaInicial = 14
global.horaAlvo = 19

global.hora = 18
global.minuto = 58