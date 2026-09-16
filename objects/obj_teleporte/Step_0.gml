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

if id = inst_59250D20{
	destino = rm_defumacao
	xx = 600
	yy = 732
}

if id = inst_46479F3F{
	destino = rm_PSE2
	xx = 360
	yy = 67
}

if id = inst_2F189D0{
	destino = rm_casas
	xx = 600
	yy = 732
}

if id = inst_46479F3F1{
	destino = rm_PSD2
	xx = 2688
	yy = 67
}
