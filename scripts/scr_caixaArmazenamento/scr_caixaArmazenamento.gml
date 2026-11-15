// scr_caixaArmazem
// Funções da caixa de armazenamento (obj_caixaArmazem).
// Chame sempre de dentro de um evento do obj_caixaArmazem: as funções usam as
// variáveis da própria caixa (foco, arrastando, tamSlot, caixaMax, painelX...),
// que são criadas no Create do objeto.

// =====================================================
// ACESSO AOS DADOS
// _caixa: true = caixa | false = inventário do jogador
// (sempre escreve direto nos globais, sem copiar arrays)
// =====================================================

// Garante que global.Caixainventario existe e está no formato certo:
// no mínimo 2 espaços, cada um como [id, quantidade] ([0,0] = vazio).
// Corrige listas criadas como [[],[]] ou [[0],[0]], que davam erro de índice.
function scr_caixaNormalizar(){
	if (!variable_global_exists("Caixainventario") or !is_array(global.Caixainventario)){
		global.Caixainventario = [[0,0],[0,0]]
	}
	while (array_length(global.Caixainventario) < 2){
		array_push(global.Caixainventario, [0,0])
	}
	for (var i = 0; i < array_length(global.Caixainventario); i++){
		var _s = global.Caixainventario[i]
		if (!is_array(_s) or array_length(_s) < 2){
			global.Caixainventario[i] = [0,0]
		}
	}
}

// Espaço vazio: id 0 OU quantidade 0 (o obj_inventario trata quantidade 0 como vazio,
// então um espaço pode ficar com o id antigo e quantidade 0).
function scr_caixaVazio(_caixa, _i){
	var _s = scr_caixaGetSlot(_caixa, _i)
	return (_s[0] == 0 or _s[1] <= 0)
}

// Converte uma tecla de scr_getBinds em código numérico para keyboard_check*.
// Aceita letra ("D") ou código já numérico (ord("D"), vk_space).
function scr_caixaTecla(_bind){
	return is_string(_bind) ? ord(_bind) : _bind
}

function scr_caixaTamanho(_caixa){
	return _caixa ? array_length(global.Caixainventario) : array_length(global.inventario)
}

function scr_caixaGetSlot(_caixa, _i){
	return _caixa ? global.Caixainventario[_i] : global.inventario[_i]
}

function scr_caixaSetSlot(_caixa, _i, _id, _qtd){
	if (_caixa){
		global.Caixainventario[_i] = [_id, _qtd]
	}
	else{
		global.inventario[_i] = [_id, _qtd]
	}
}

// Quantos itens _id o jogador tem no inventário
function scr_caixaContarItem(_id){
	var _total = 0
	for (var i = 0; i < array_length(global.inventario); i++){
		if (global.inventario[i][0] == _id){
			_total += global.inventario[i][1]
		}
	}
	return _total
}

// Tira _qtd unidades de _id do inventário do jogador
function scr_caixaRemoverItem(_id, _qtd){
	for (var i = 0; i < array_length(global.inventario); i++){
		if (global.inventario[i][0] == _id){
			var _tira = min(_qtd, global.inventario[i][1])
			var _resta = global.inventario[i][1] - _tira
			if (_resta <= 0){
				global.inventario[i] = [0, 0]
			}
			else{
				global.inventario[i] = [_id, _resta]
			}
			_qtd -= _tira
			if (_qtd <= 0){
				break
			}
		}
	}
}

// =====================================================
// TRANSFERÊNCIA DE ITENS
// Move o espaço inteiro (_deCaixa, _slotOrigem) para o outro lado.
// _slotDestino (opcional): espaço escolhido ao arrastar. Se estiver vazio ou tiver
// o mesmo item, é usado; senão o item vai para o espaço do mesmo item (empilha)
// ou para o primeiro espaço vazio.
// =====================================================

function scr_caixaTransferir(_deCaixa, _slotOrigem, _slotDestino = -1){
	var _paraCaixa = !_deCaixa
	if (scr_caixaVazio(_deCaixa, _slotOrigem)){
		return false
	}
	var _origem = scr_caixaGetSlot(_deCaixa, _slotOrigem)
	var _id = _origem[0]
	var _qtd = _origem[1]

	var _n = scr_caixaTamanho(_paraCaixa)
	var _alvo = -1

	// 1) espaço escolhido pelo jogador (arrastar)
	if (_slotDestino >= 0 and _slotDestino < _n){
		if (scr_caixaVazio(_paraCaixa, _slotDestino) or scr_caixaGetSlot(_paraCaixa, _slotDestino)[0] == _id){
			_alvo = _slotDestino
		}
	}

	// 2) já existe esse item no destino: empilha
	if (_alvo == -1){
		for (var i = 0; i < _n; i++){
			if (scr_caixaGetSlot(_paraCaixa, i)[0] == _id and !scr_caixaVazio(_paraCaixa, i)){
				_alvo = i
				break
			}
		}
	}

	// 3) primeiro espaço vazio
	if (_alvo == -1){
		for (var i = 0; i < _n; i++){
			if (scr_caixaVazio(_paraCaixa, i)){
				_alvo = i
				break
			}
		}
	}

	// Sem espaço no destino
	if (_alvo == -1){
		return false
	}

	var _destino = scr_caixaGetSlot(_paraCaixa, _alvo)
	if (_destino[0] == _id and !scr_caixaVazio(_paraCaixa, _alvo)){
		scr_caixaSetSlot(_paraCaixa, _alvo, _id, _destino[1] + _qtd)
	}
	else{
		scr_caixaSetSlot(_paraCaixa, _alvo, _id, _qtd)
	}
	scr_caixaSetSlot(_deCaixa, _slotOrigem, 0, 0)

	audio_play_sound(snd_pop,5,0)
	return true
}

// =====================================================
// EXPANSÃO DA CAIXA
// =====================================================

// Lenhas que o próximo espaço custa (3º espaço = custoExpansao[0], 4º = [1]...)
function scr_caixaCustoProximo(){
	var _n = array_length(global.Caixainventario)
	return custoExpansao[clamp(_n - 2, 0, array_length(custoExpansao) - 1)]
}

function scr_caixaExpandir(){
	if (array_length(global.Caixainventario) >= caixaMax){
		return false
	}
	var _custo = scr_caixaCustoProximo()
	if (scr_caixaContarItem(idLenha) < _custo){
		return false
	}
	scr_caixaRemoverItem(idLenha, _custo)
	array_push(global.Caixainventario, [0, 0])
	audio_play_sound(snd_chaChing,8,0)
	return true
}

// =====================================================
// LAYOUT E POSIÇÕES (GUI)
// =====================================================

function scr_caixaCalcularLayout(){
	var _gw = display_get_gui_width()
	var _gh = display_get_gui_height()
	painelW = caixaMax * tamSlot + (caixaMax - 1) * espSlot + 96
	painelH = 600
	painelX = (_gw - painelW) / 2
	painelY = (_gh - painelH) / 2
	caixaY = painelY + 64
	textoY = caixaY + tamSlot + 16
	jogadorY = painelY + 394
}

// Retângulo de um espaço. A linha da caixa sempre tem caixaMax posições visuais.
function scr_caixaRetanguloSlot(_caixa, _i){
	var _n = _caixa ? caixaMax : array_length(global.inventario)
	var _larg = _n * tamSlot + (_n - 1) * espSlot
	var _x1 = painelX + (painelW - _larg) / 2 + _i * (tamSlot + espSlot)
	var _y1 = _caixa ? caixaY : jogadorY
	return {x1: _x1, y1: _y1, x2: _x1 + tamSlot, y2: _y1 + tamSlot}
}

function scr_caixaRetanguloFechar(){
	return {x1: painelX + painelW - 56, y1: painelY + 12, x2: painelX + painelW - 16, y2: painelY + 52}
}

// Quantos espaços podem ser selecionados na linha (a da caixa inclui o "+")
function scr_caixaNumNavegaveis(_caixa){
	var _n = scr_caixaTamanho(_caixa)
	if (_caixa and _n < caixaMax){
		_n += 1
	}
	return _n
}

// Espaço sob o mouse: {caixa, i} ou undefined
function scr_caixaAcharSlot(_mx, _my){
	for (var i = 0; i < scr_caixaNumNavegaveis(true); i++){
		var _r = scr_caixaRetanguloSlot(true, i)
		if (point_in_rectangle(_mx, _my, _r.x1, _r.y1, _r.x2, _r.y2)){
			return {caixa: true, i: i}
		}
	}
	for (var i = 0; i < scr_caixaNumNavegaveis(false); i++){
		var _r = scr_caixaRetanguloSlot(false, i)
		if (point_in_rectangle(_mx, _my, _r.x1, _r.y1, _r.x2, _r.y2)){
			return {caixa: false, i: i}
		}
	}
	return undefined
}

// Mouse dentro da linha inteira (com uma folga): onde soltar um item arrastado
function scr_caixaDentroZona(_caixa, _mx, _my){
	var _n = _caixa ? caixaMax : array_length(global.inventario)
	var _a = scr_caixaRetanguloSlot(_caixa, 0)
	var _b = scr_caixaRetanguloSlot(_caixa, _n - 1)
	return point_in_rectangle(_mx, _my, _a.x1 - 16, _a.y1 - 16, _b.x2 + 16, _b.y2 + 16)
}

// =====================================================
// ABRIR / FECHAR
// =====================================================

function scr_caixaAbrir(){
	scr_caixaNormalizar()
	caixaEstado = 1
	global.pause = true
	travaInput = 2
	foco = {caixa: false, i: 0}
	arrastando = undefined
	mxAnt = device_mouse_x_to_gui(0)
	myAnt = device_mouse_y_to_gui(0)
	depthOriginal = depth
	// Fica por cima dos outros elementos da GUI, mas logo atrás do obj_cursor
	// (depth maior = desenhado antes). Sem cursor na room, usa um valor bem baixo.
	depth = instance_exists(obj_cursor) ? obj_cursor.depth + 1 : -9999
}

function scr_caixaFechar(){
	caixaEstado = 0
	arrastando = undefined
	global.pause = false
	depth = depthOriginal
}

// =====================================================
// DESENHO
// =====================================================

// Desenha um item (sprite + quantidade) centralizado em _cx, _cy
function scr_caixaDesenharItem(_id, _qtd, _cx, _cy, _alpha){
	var _item = scr_getItem(_id)
	var _esc = (tamSlot * 0.55) / max(sprite_get_width(spr_item), sprite_get_height(spr_item))
	draw_sprite_ext(spr_item, _item.frame, _cx, _cy, _esc, _esc, 0, c_white, _alpha)
	if (_qtd > 1){
		draw_set_halign(fa_right)
		draw_set_valign(fa_bottom)
		draw_set_color(c_white)
		draw_set_alpha(_alpha)
		draw_text(_cx + tamSlot / 2 - 8, _cy + tamSlot / 2 - 6, "x" + string(_qtd))
		draw_set_alpha(1)
	}
}

// _tipo: 0 = espaço liberado | 1 = "+" (próximo a liberar) | 2 = bloqueado
function scr_caixaDesenharSlot(_caixa, _i, _tipo){
	var _r = scr_caixaRetanguloSlot(_caixa, _i)
	var _cx = (_r.x1 + _r.x2) / 2
	var _cy = (_r.y1 + _r.y2) / 2
	var _comFoco = (foco.caixa == _caixa and foco.i == _i and _tipo != 2)

	// Fundo
	if (_tipo == 0){
		draw_set_color(make_colour_rgb(190, 190, 190))
		draw_set_alpha(0.45)
	}
	else{
		draw_set_color(make_colour_rgb(60, 60, 60))
		draw_set_alpha(0.7)
	}
	draw_rectangle(_r.x1, _r.y1, _r.x2, _r.y2, false)

	// Borda
	draw_set_alpha(1)
	draw_set_color(_comFoco ? c_yellow : c_white)
	draw_rectangle(_r.x1, _r.y1, _r.x2, _r.y2, true)
	if (_comFoco){
		draw_rectangle(_r.x1 + 1, _r.y1 + 1, _r.x2 - 1, _r.y2 - 1, true)
		draw_rectangle(_r.x1 + 2, _r.y1 + 2, _r.x2 - 2, _r.y2 - 2, true)
	}

	// Conteúdo
	if (_tipo == 0){
		var _slot = scr_caixaGetSlot(_caixa, _i)
		if (!scr_caixaVazio(_caixa, _i)){
			var _sendoArrastado = (arrastando != undefined and arrastando.deCaixa == _caixa and arrastando.i == _i)
			scr_caixaDesenharItem(_slot[0], _slot[1], _cx, _cy, _sendoArrastado ? 0.3 : 1)
		}
	}
	else if (_tipo == 1){
		draw_set_color(c_white)
		draw_line_width(_cx - 24, _cy, _cx + 24, _cy, 4)
		draw_line_width(_cx, _cy - 24, _cx, _cy + 24, 4)
	}
}