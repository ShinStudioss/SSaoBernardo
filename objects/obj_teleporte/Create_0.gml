if (destino != noone){
    var _yy_base = 512
    var _passo = 2
    var _distancia_max = 96

    if (x > room_width / 2){
        xx = 64
    }
    else{
        xx = room_get_info(destino).width - 64
	}
    yy = _yy_base

    while (place_meeting(xx, yy, obj_colisor) and yy > _yy_base - _distancia_max){
        yy -= _passo
	}
}