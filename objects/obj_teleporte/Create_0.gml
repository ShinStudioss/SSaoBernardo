if global.seringalRooms.direita = room{
	if x > room_width/2{
		destino = rm_PSD1
	}
	else{
		destino = rm_seringal
	}
}

else if global.seringalRooms.esquerda = room{
	if x > room_width/2{
		destino = rm_seringal
	}
	else{
		destino = rm_PSE1
	}
}

