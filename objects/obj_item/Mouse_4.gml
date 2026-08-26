if (distance_to_object(obj_jogador) < 69 && !instance_exists(obj_dialogBox)) {
    var inventario_livre = false;

    for (var i = 0; i < array_length(global.inventario); i++) {
        if (global.inventario[i][0] == 0 && global.inventario[i][1] == 0) {
            inventario_livre = true;
            break;
        }
    }

    if (inventario_livre) {
		global.pause = true
        criar_dialogo([
            $"Dá pra ver de longe algo brilhando no chão; {item.nome}... Parece ser {quantidade}. É um pouco perigoso deixar aqui, alguém do seringal pode encontrar.",
            $"Pegar {item.nome}?",
			""
        ], true, [
            {text:"Sim, pegar o item.", action:"pegar_item"},
            {text:"Não, deixe-o no chão.", action:"cancel"}
        ]);
    } else {
        criar_dialogo([
            "Seu inventário está cheio.",
            "Você não pode carregar mais itens."
        ], false, []);
    }
}