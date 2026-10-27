if global.clima = "chovendo"{
	instance_destroy()
	exit
}

quantidade = 0
quantidadeMax = 600
dripFrame = 0

randomise()

state = irandom(5)
if state = 5{
	state = "ocupado"
}
else{
	state = "sembalde"
}

chave = room_get_name(room) + "_" + string(x) + "_" + string(y);

if variable_struct_exists(global.coletas, chave){
	var dados = global.coletas[$ chave];

	state = dados.state;
	quantidade = dados.quantidade;
	dripFrame = dados.dripFrame;

	if state == "corte"{
		var framesFora = (current_time - dados.saiuEm) / 1000 * game_get_speed(gamespeed_fps);
		quantidade = min(quantidade + framesFora, quantidadeMax);

		if quantidade >= quantidadeMax{
			state = "cheio";
			dripFrame = 0;
		}
	}
}
randomise()
if state == "ocupado"{
	instance_create_depth(x-30,y,depth-irandom(5),obj_npcSering)
}