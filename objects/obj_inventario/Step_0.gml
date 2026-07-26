item = global.inventario[arrayPos][0]
quantidade = global.inventario[arrayPos][1]

if quantidade = 0{ item = 0}

//Automatico

if global.municaoSG == 0 and scr_buscarItem(19) != noone{
	scr_removerItem(19,1)
	global.municaoSG = global.municaoSG_max
}

if global.municaoWIN == 0 and scr_buscarItem(20) != noone{
	scr_removerItem(20,1)
	global.municaoWIN = global.municaoWIN_max
}

//Manual ("E" para recarregar)

if global.itemSelecionado == scr_buscarItem(17).arrayPos
and global.municaoSG > 0 and global.municaoSG < 4
and keyboard_check_pressed(ord("E")){
	scr_removerItem(19,1)
	global.municaoSG = global.municaoSG_max
}

if global.itemSelecionado == scr_buscarItem(18).arrayPos
and global.municaoWIN > 0 and global.municaoWIN < 8
and keyboard_check_pressed(ord("E")){
	scr_removerItem(20,1)
	global.municaoWIN = global.municaoWIN_max
}
