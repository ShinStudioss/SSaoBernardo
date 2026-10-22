function criar_dialogo(textoArray_,options_,optionsStruct_,zoomAmt=1.7,som=snd_rabiscoVoz,textSpeed=0.5,voiceFrequency=2){
	if !instance_exists(obj_dialogBox){
		var dialogo = instance_create_depth(x,y,depth,obj_dialogBox,{
			caller: id,
			textArray: textoArray_,
			options: options_,
			optionsStruct: optionsStruct_,
			zoomAmount: zoomAmt,
			voz: som,
			textSpeed: textSpeed,
			voiceFrequency: voiceFrequency
		})
	}
	return dialogo
}

function scr_dica() {
    var _roomsEsquerda = [rm_PSE1, rm_PSE2, rm_defumacao]
    var _roomsDireita = [rm_PSD1, rm_PSD2, rm_casas]
	var _dica = "Não fiquei sabendo de nada por hoje, viu?"
    for (var i = 0; i < array_length(global.itens_mundo); i++){
		if array_contains(_roomsEsquerda,global.itens_mundo[i]._room){
			if global.itens_mundo[i]._room = rm_defumacao{
				_dica = "Fiquei sabendo que tem um negocio escondido lá pelas defumadoras ao oeste, viu?"
				return _dica
			}
			_dica = "Fiquei sabendo que tem um negocio escondido lá pelos matos da Esquerda, viu?"
			return _dica
		}
		if array_contains(_roomsDireita,global.itens_mundo[i]._room){
			if global.itens_mundo[i]._room = rm_casas{
				_dica = "Fiquei sabendo que tem um negocio escondido lá pelas casinhas ao leste, viu?"
				return _dica
			}
			_dica = "Fiquei sabendo que tem um negocio escondido lá pelos matos da Direita, viu?"
			return _dica
		}
	}
	return _dica
}






