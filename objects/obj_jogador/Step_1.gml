if mouse_check_button_pressed(mb_left) and global.itemSelecionado = 5{
	scr_removerItem(5,1)
	scr_addItem(4,1)
}

// TESTES
if (keyboard_check_pressed(ord("H")))
{
    global.saude = max(0, global.saude - 10);
}

if (keyboard_check_pressed(ord("E")))
{
    global.energia = max(0, global.energia - 10);
}