if !instance_exists(obj_controladorDoJogo) exit

if id = inst_27A9F734{
	destino = rm_PSD1
	xx = 64
	yy = 512
}

if id = inst_126BD70B{
	destino = rm_PSE1
	xx = room_get_info(destino).width - 96
	yy = 512
}

