item = global.inventario[arrayPos][0]
quantidade = global.inventario[arrayPos][1]

if quantidade = 0{ item = 0}

if global.municao12 == 0 and scr_buscarItem(19) != noone{
	scr_removerItem(19,1)
	global.municao12 = global.municao12Max
}
if global.municaoCar == 0 and scr_buscarItem(20) != noone{
	scr_removerItem(20,1)
	global.municaoCar = global.municaoCarMax
}

if (keyboard_check_pressed(ord("E"))) {

    if (global.itemSelecionado == scr_buscarItem(17).arrayPos) &&
       (global.municao12 > 0 and global.municao12 < global.municao12Max){
        scr_removerItem(19, 1);
        global.municao12 = global.municao12Max;
    }

    if (global.itemSelecionado == scr_buscarItem(18).arrayPos) &&
       (global.municaoCar > 0 and global.municaoCar < global.municaoCarMax){
        scr_removerItem(20, 1);
        global.municaoCar = global.municaoCarMax;
    }

}

