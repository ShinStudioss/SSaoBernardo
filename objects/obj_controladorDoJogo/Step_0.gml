if global.cameraEstatica
{
	var cam = view_camera[0];

	var proporcao = display_get_width() / display_get_height();

	var cam_h = room_height;
	var cam_w = cam_h * proporcao;

	camera_set_view_size(cam, cam_w, cam_h);
	camera_set_view_pos(
		cam,
		(room_width - cam_w) / 2,
		(room_height - cam_h) / 2
	);
}
else if instance_exists(obj_jogador)
{
	x = lerp(x, alvoCam.x, 0.1);
	y = lerp(y, alvoCam.y - alturaCam / 6, 0.1);

	larguraCam = lerp(larguraCam, larguraCamAlvo, 0.1);
	alturaCam = lerp(alturaCam, alturaCamAlvo, 0.1);

	var shake_x = random_range(-shake, shake);
	var shake_y = random_range(-shake, shake);

	camera_set_view_size(view_camera[0], larguraCam, alturaCam);

	camera_set_view_pos(
		view_camera[0],
		x - larguraCam / 2 + shake_x,
		y - alturaCam / 2 + shake_y
	);

	shake = max(0, shake - shake_decay);
}

var cam_x = camera_get_view_x(view_camera[0]);

layer_x("lay_backgroundFundo", cam_x * 0);
layer_x("lay_backgroundFrente", cam_x * 0.05);

if !audio_is_playing(snd_ambiente){
	audio_play_sound(snd_ambiente, 0, true);
}

if vinhetaVermelha > 0{
	vinhetaVermelha -= 0.05;
}