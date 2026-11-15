if (caixaEstado != 1){
	exit
}

var _fonte = draw_get_font()
var _cor = draw_get_color()
var _alpha = draw_get_alpha()
var _halign = draw_get_halign()
var _valign = draw_get_valign()

draw_set_font(fnt_hud)
scr_caixaCalcularLayout()

var _gw = display_get_gui_width()
var _gh = display_get_gui_height()
var _nCaixa = array_length(global.Caixainventario)

// Escurece o jogo e desenha o painel
draw_set_color(c_black)
draw_set_alpha(0.6)
draw_rectangle(0, 0, _gw, _gh, false)
draw_set_alpha(0.85)
draw_rectangle(painelX, painelY, painelX + painelW, painelY + painelH, false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(painelX, painelY, painelX + painelW, painelY + painelH, true)

// Títulos
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(painelX + 48, caixaY - 28, "Inventário da caixa")
draw_text(painelX + 48, jogadorY - 28, "Inventário do jogador")

// Botão fechar
var _bf = scr_caixaRetanguloFechar()
draw_rectangle(_bf.x1, _bf.y1, _bf.x2, _bf.y2, true)
draw_set_halign(fa_center)
draw_text((_bf.x1 + _bf.x2) / 2, (_bf.y1 + _bf.y2) / 2, "X")

// Espaços da caixa (sempre 6 posições: liberados, "+" e bloqueados)
for (var i = 0; i < caixaMax; i++){
	var _tipo = (i < _nCaixa) ? 0 : ((i == _nCaixa) ? 1 : 2)
	scr_caixaDesenharSlot(true, i, _tipo)
}

// Espaços do jogador
for (var i = 0; i < array_length(global.inventario); i++){
	scr_caixaDesenharSlot(false, i, 0)
}

// Texto sob a linha da caixa: expansão ou descrição do item em foco
var _tx = painelX + 48
var _ty = textoY
draw_set_halign(fa_left)
draw_set_valign(fa_top)

if (foco.caixa and foco.i == _nCaixa and _nCaixa < caixaMax){
	var _custo = scr_caixaCustoProximo()
	var _tem = scr_caixaContarItem(idLenha)
	var _unidade = (_custo == 1) ? " lenha" : " lenhas"
	draw_set_color(c_white)
	draw_text_transformed(_tx, _ty, "Clique para aumentar o tamanho da caixa.", 0.9, 0.9, 0)
	draw_set_color((_tem >= _custo) ? c_yellow : c_red)
	draw_text_transformed(_tx, _ty + 34, "Preço: " + string(_custo) + _unidade + "  (você tem " + string(_tem) + ")", 0.9, 0.9, 0)
}
else if (foco.i < scr_caixaTamanho(foco.caixa) and !scr_caixaVazio(foco.caixa, foco.i)){
	var _it = scr_getItem(scr_caixaGetSlot(foco.caixa, foco.i)[0])
	draw_set_color(c_yellow)
	draw_text_transformed(_tx, _ty, _it.nome, 1, 1, 0)
	draw_set_color(c_white)
	draw_text_transformed(_tx, _ty + 34, _it.descricao, 0.8, 0.8, 0)
}
else{
	draw_set_color(c_white)
	draw_text_transformed(_tx, _ty, descricaoPadrao, 0.8, 0.8, 0)
}

// Dica de controles
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_ltgray)
draw_text_transformed(painelX + painelW / 2, painelY + painelH - 30, "Arraste, Shift + clique, ou WASD/setas + Espaço para mover itens   |   E: fechar", 0.7, 0.7, 0)

// Item sendo arrastado (por cima de tudo)
if (arrastando != undefined){
	scr_caixaDesenharItem(arrastando.id, arrastando.qtd, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0.85)
}

// Restaura o estado de desenho
draw_set_font(_fonte)
draw_set_color(_cor)
draw_set_alpha(_alpha)
draw_set_halign(_halign)
draw_set_valign(_valign)
 