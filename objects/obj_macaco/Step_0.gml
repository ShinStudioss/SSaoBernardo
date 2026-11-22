event_inherited()

if (global.pause) exit
if (!instance_exists(obj_jogador)) exit

var _distancia = point_distance(x, y, obj_jogador.x, obj_jogador.y)

// Fica parado, só olha para o jogador
if (abs(obj_jogador.x - x) > 4){
	dir = sign(obj_jogador.x - x)
}
image_xscale = dir

// Lança pedra quando o jogador está no alcance
if (_distancia <= alcanceVisao){
	timerLancar--

	if (timerLancar <= 0){
		image_speed = 1
		instance_create_depth(x + dir * 20, y - 20, depth - 1, obj_pedra, {
			dono: id,
			alvoX: obj_jogador.x,
			alvoY: obj_jogador.y,
			velH: velPedra
		})
		timerLancar = tempoLancar
	}
}