// Cãmera =====================================================================
// Esse trecho é dedicado a fazer a câmera seguir o jogador invés de ficar
// estática

if global.cameraEstatica = false and instance_exists(obj_jogador)
{
	x = lerp(x, alvoCam.x, 0.1)
	y = lerp(y, alvoCam.y - alturaCam / 6, 0.1)

	larguraCam = lerp(larguraCam, larguraCamAlvo, 0.1)
	alturaCam = lerp(alturaCam, alturaCamAlvo, 0.1)

	camera_set_view_size(view_camera[0], larguraCam, alturaCam)
	camera_set_view_pos(view_camera[0], x - larguraCam / 2, y - alturaCam / 2)
}

var cam_x = camera_get_view_x(view_camera[0]);

layer_x("lay_backgroundFundo", cam_x * 0);
layer_x("lay_backgroundFrente", cam_x * 0.05);

if !audio_is_playing(snd_ambiente){
	audio_play_sound(snd_ambiente,0,true)
}


