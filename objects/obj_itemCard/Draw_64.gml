if obj_barracao.lojaEstado = 2{
	// =====================================================
	// POSIÇÃO
	// =====================================================

	var larguraTotal = 6 * largura + 5 * espaco;

	var cardX = (display_get_gui_width() - larguraTotal) / 2
	          + shopId * (largura + espaco);

	var cardY = 96;


	// =====================================================
	// FUNDO
	// =====================================================

	draw_set_color(c_black);
	draw_set_alpha(0.4);

	draw_rectangle(
	    cardX,
	    cardY,
	    cardX + largura,
	    cardY + altura,
	    false
	);

	draw_set_alpha(1);
	draw_set_color(c_white);


	// =====================================================
	// ENCERRAR NEGOCIAÇÕES
	// =====================================================

	if (shopId == 5)
	{
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);

	    draw_text(
	        cardX + largura / 2,
	        cardY + altura / 2,
	        "Encerrar\nnegociações"
	    );
	}


	// =====================================================
	// ITEM
	// =====================================================

	else
	{
	    draw_sprite_ext(
	        spr_item,
	        item.frame,
	        cardX + largura / 2,
	        cardY + altura / 2 - 15,
	        escala * 1.5,
	        escala* 1.5,
	        0,
	        c_white,
	        1
	    );

	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);

	    draw_text(
	        cardX + largura / 2,
	        cardY + altura - 40,
	        item.nome
	    );
		draw_text_transformed_colour(
	        cardX + largura / 2,
	        cardY + altura - 15,
			$"Preço: {item.preco}",
			escala*0.6,escala*0.6,0,
			c_yellow,c_yellow,c_orange,c_orange,1
	    );
	}


	// Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}