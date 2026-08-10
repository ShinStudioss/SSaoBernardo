keybinds = scr_getBinds()

if (obj_jogador.jumpSpeed > 0) and (obj_jogador.y <= y-15)  // Só funciona se estiver caindo
{
	if Impulso_extra == true and keyboard_check(keybinds.up){
		obj_jogador.jumpSpeed = -30;
	}
	else{
		obj_jogador.jumpSpeed = -20
	}

    obj_jogador.pulando = true;
	obj_cursor.ataque_ar = true;
    obj_jogador.coyoteTime = 0;

    // Efeito visual (opcional)
	obj_jogador.xScaleReal = sign(obj_jogador.xScaleReal) * 0.6;
	obj_jogador.yScaleReal = 1.8;

    // Opcional: animação do trampolim
    image_yscale = 0.7;
}