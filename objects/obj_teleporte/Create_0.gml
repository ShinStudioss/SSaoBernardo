if destino != noone{
if x > room_width/2{
	xx = 64
	yy = room_get_info(destino).height - 128
}

else{
	xx = room_get_info(destino).width - 64
	yy = room_get_info(destino).height - 128
}
}