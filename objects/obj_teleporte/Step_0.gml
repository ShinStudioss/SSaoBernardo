if !instance_exists(obj_controladorDoJogo) exit

if id = inst_27A9F734{
	destino = global.seringalRooms.direita
	xx = 64
	yy = 512
}

if id = inst_126BD70B{
	destino = global.seringalRooms.esquerda
	xx = room_get_info(destino).width - 96
	yy = 512
}

if global.seringalRooms.direita = room{
	if x > room_width/2{
		destino = rm_PSD1
		xx = 64
		yy = 512
	}
	else{
		destino = rm_seringal
		xx = 1792
		yy = 512
	}
}

else if global.seringalRooms.esquerda = room{
	if x > room_width/2{
		destino = rm_seringal
		xx = 64
		yy = 512
	}
	else{
		destino = rm_PSE1
		yy = 512
		xx = room_get_info(destino).width - 96
	}
}
