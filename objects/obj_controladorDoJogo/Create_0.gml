application_surface_draw_enable(false)
// Debug mode =====================================================================================
// Essa variável é usada em vários lugares como um modo de debugar o jogo, Obviamente vai estar desligada 
// no jogo final, mas será útil pra testes aqui

global.debugMode = true

// Definição de controles ===================================================================================
// Array de teclas que são armazenadas em variáveis que por sua vez são armazenadas em uma struct. Pode ser alterado 
// mas por padrão segue os valores dentro do codigo abaixo

var keybinds = {
	right: ord("D"),
	left: ord("A"),
	down: ord("S"),
	up: ord("W"),
	jump: vk_space,
	run: vk_shift,
	interact: ord("E"),
	item1: ord("1"),
	item2: ord("2"),
	item3: ord("3"),
	item4: ord("4")
};

scr_setBinds(keybinds)

// Outrás variáveis =======================================================
// Alguns exemplos para cá são a câmera ser estática ou não e outras coisas

larguraCam = 1152
alturaCam = 648
larguraCamAlvo = 1152
alturaCamAlvo = 648
alvoCam = obj_jogador
global.cameraEstatica = false
display_reset(0, true);
filtro_cor_set(c_white, 0);

global.transitionX = 0
global.combustivelPoronga = 0
global.itemSelecionado = 0
global.transitionY = 0
global.pause = false
draw_set_font(fnt_hud)

global.inventario = [[1,3],[13,10],[14,1],[9,1]]
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

global.tutorial = [[0]]



