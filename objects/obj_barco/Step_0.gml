tempo += 0.04;
y = yInicial + sin(tempo) * 10;
if x <= room_width/4{
	speed = lerp(speed,0,0.2)
}

if (partindo) exit
if (!instance_exists(obj_jogador)) exit

// Interagir com o barco
if (distance_to_object(obj_jogador) < distanciaInteracao
and !instance_exists(obj_dialogBox)
and keyboard_check_pressed(ord("E"))
and global.pause == false){

	global.pause = true

	criar_dialogo([
		"O barco está pronto para partir.",
		"Avançar na fuga? Vale a pena dar uma olhada naquele arbusto suspeito.",
		""
	], true, [
		{text:"Sim, ir embora.", action:"ir_embora"},
		{text:"Não, ficar mais um pouco.", action:"cancel"}
	]);
}