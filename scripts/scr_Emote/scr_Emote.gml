function scr_Emote(sprite){
	if sprite != spr_jogadorAtacando{
		obj_jogador.idleSprite = sprite;
		obj_jogador.image_index = 0;
		obj_jogador.alarm[1] = 90;
	}
	else{
		obj_jogador.sprite_index = spr_jogadorAtacando;
		obj_jogador.idleSprite = spr_jogadorParado;
	}
}