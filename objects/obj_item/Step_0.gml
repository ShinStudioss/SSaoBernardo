if place_empty(x,y+1,obj_colisor){
	queda += obj_jogador.gravidade
	y+=queda
}

var _inst_colisao = instance_place(x, y, obj_item)
if (_inst_colisao != noone) {
    if (_inst_colisao.item_id == item_id) {
        if (id < _inst_colisao.id) {
            quantidade += _inst_colisao.quantidade 
			_inst_colisao.executar_destroy = false
            instance_destroy(_inst_colisao)
        }
    }
}