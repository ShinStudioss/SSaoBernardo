state = "semlatex"


quantidade = 0
quantidadeMax = 600
escalaItem = 1
dripFrame = 0

chave = room_get_name(room) + "_" + string(x) + "_" + string(y);

if variable_struct_exists(global.coletas, chave){
	var dados = global.coletas[$ chave];

	state = dados.state;
	quantidade = dados.quantidade;
	dripFrame = dados.dripFrame;

	if state == "comlatex"{
		var framesFora = (current_time - dados.saiuEm) / 1000 * game_get_speed(gamespeed_fps);
		quantidade = min(quantidade + framesFora, quantidadeMax);

		if quantidade >= quantidadeMax{
			state = "pronto";
			dripFrame = 0;
		}
	}
}
