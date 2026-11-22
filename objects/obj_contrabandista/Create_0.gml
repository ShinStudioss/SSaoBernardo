// Estados da loja: 0 = fechada | 1 = abrindo | 2 = aberta | 3 = encerrando
// (o obj_itemCard só aparece quando lojaEstado == 2)
lojaEstado = 0

// Efeitos do contador de dinheiro (iguais aos do obj_comercio)
dinheiroEfeitos = 0
escala = 1
rotacao = 0
cor = c_white
shake = 0
descricao = 0
descricaoTexto = "Passe o cursor pelos itens para mais informações."

// Posição do contador de dinheiro na GUI (coordenadas da GUI).
// O obj_comercio desenha o dinheiro no x e y que ele tem na room rm_barracao.
// Para ficar no mesmo lugar, abra a rm_barracao, clique no obj_comercio, copie o X e o Y
// e coloque aqui. Enquanto dinheiroX for undefined, fica centralizado no topo.
dinheiroX = undefined
dinheiroY = 48

// Itens que o obj_comercio também vende: aqui eles saem mais baratos.
// Qualquer item fora desta lista é exclusivo do contrabandista (preço normal).
itensComercio = [1, 3, 4, 6, 8, 9, 10, 13, 14, 15]
descontoComercio = 0.7 // 0.7 = 30% mais barato (antes do arredondamento)
passoPreco = 5 // os preços do jogo são múltiplos de 5, então o preço com desconto também é

// Estoque (quantidade restante) de cada slot do pool; -1 = ainda não definido.
// O obj_itemCard preenche com o "quantidade" do scr_getItem (itens sem esse campo valem 1).
estoque = array_create(6, -1)

ehItemDoComercio = function(_idItem){
	for (var i = 0; i < array_length(itensComercio); i++){
		if (itensComercio[i] == _idItem){
			return true
		}
	}
	return false
}

// Chamado pelo obj_itemCard para saber quanto cobrar (recebe o struct do item).
// Itens do comercio: desconto arredondado para o múltiplo de 5 mais próximo
// (nunca abaixo de 5 e nunca acima do preço original). Ex.: 25 -> 20, 20 -> 15, 15 -> 10, 10 -> 5.
// Itens exclusivos: preço normal.
calcularPreco = function(_idItem, _item){
	if (ehItemDoComercio(_idItem)){
		var _comDesconto = floor(_item.preco * descontoComercio / passoPreco + 0.5) * passoPreco
		return clamp(_comDesconto, passoPreco, _item.preco)
	}
	return _item.preco
}

// Diálogo de aviso ("passe o cursor...").
// _animado = true : o diálogo original, com a animação de escrever e que pula com clique/espaço.
// _animado = false: configuração dos diálogos dos itens (obj_itemCard): texto direto e sem
//                   fechar com clique/espaço. Usado pela rede de segurança do End Step.
criarDialogoDescricao = function(_animado){
	if (_animado){
		descricao = criar_dialogo([string(descricaoTexto)],0,[])
	}
	else{
		descricao = criar_dialogo([string(descricaoTexto)],false,[],,,999,999)
		descricao.skippable = false
	}
}

// Desenha o contador de dinheiro na GUI. Quem chama é o card "Encerrar negociações"
// (obj_itemCard, shopId 5), que garante que ele aparece junto com os cards.
// Mesmo código do Draw GUI do obj_comercio.
desenharDinheiro = function(){
	if (dinheiroEfeitos == true){
		audio_play_sound(snd_moneyPickup,8,0)
		cor = c_yellow
		escala = 2
		rotacao = random_range(-45,45)
		scr_freeze(10)
		shake = 10
		dinheiroEfeitos = false
	}

	var _x = is_undefined(dinheiroX) ? display_get_gui_width() / 2 : dinheiroX
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	draw_text_transformed_colour(_x,dinheiroY-shake,"R$" + string(global.dinheiro),escala,escala,rotacao,cor,cor,cor,cor,1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

temNoPool = function(_idItem){
	for (var i = 0; i < array_length(itemPool); i++){
		if (itemPool[i] == _idItem){
			return true
		}
	}
	return false
}

// IMPORTANTE: o layout tem 6 cards e o último (shopId 5) é o "Encerrar negociações",
// então só 5 itens aparecem (posições 0 a 4 do pool).
sortearEstoque = function(){
	estoque = array_create(6, -1) // novo sorteio, quantidades zeradas
	var _armaEMunicao = choose([17,19],[18,20])
	itemPool = [
		_armaEMunicao[0], // 0 - Arma de fogo
		_armaEMunicao[1], // 1 - Munição
		choose(8,9,10,11), // 2 - Arma branca
		choose(12,16), // 3 - Item de apoio
		0 // 4 - Item de tipo aleatório (sorteado abaixo, sem repetir item do pool)
	]

	var _sorteado;
	do{
		_sorteado = choose(choose(17,18),
		                   choose(8,9,10,11),
		                   choose(1,4),
		                   choose(13,14,15),
		                   choose(12,16),
		                   choose(19,20),
		                   choose(6,21))
	}
	until (!temNoPool(_sorteado))
	itemPool[4] = _sorteado
}

sortearEstoque()

// ID dos itens do jogo
// 1 - Balde
// 2 - Látex
// 3 - Faca de sangria
// 4 - Poronga
// 5 - Poronga acesa
// 6 - Querosene
// 7 - Bola de borracha
// 8 - Terçado
// 9 - Facão
// 10 - Machadinha
// 11 - Galho
// 12 - Terço
// 13 - Feijão
// 14 - Carne seca
// 15 - Farinha
// 16 - Mel
// 17 - Espingarda
// 18 - Carabina
// 19 - Munição Esp.
// 20 - Munição Car.
// 21 - Lenha