// =====================================================
// OBJ_LOJA - DRAW GUI
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);


// =====================================================
// FUNDO ESCURO
// =====================================================

draw_set_alpha(0.72);
draw_set_colour(c_black);

draw_rectangle(
    0,
    0,
    1152,
    648,
    false
);

draw_set_alpha(1);
draw_set_colour(c_white);


// =====================================================
// RODA LATERAL
// =====================================================

var meio = floor(quantidadeVisivel / 2);

for (var offset = -meio; offset <= meio; offset++)
{
    var indice = scr_wrap(
        itemSelecionado + offset,
        0,
        array_length(itensLoja) - 1
    );

    var yy =
        centroRodaY
        + offset * espacamentoItens;


    var item = scr_getItem(
        itensLoja[indice]
    );


    var selecionado = (offset == 0);

    var escala = selecionado ? 1.15 : 0.85;
    var alpha = selecionado ? 1 : 0.55;


    // -------------------------------------------------
    // ÁREA DO ITEM
    // -------------------------------------------------

    if (selecionado)
    {
        draw_set_alpha(0.25);
        draw_set_colour(c_white);

        draw_rectangle(
		    25,
		    yy - 30,
		    315,
		    yy + 30,
		    false
);

        draw_set_alpha(1);
    }


    // -------------------------------------------------
    // SPRITE
    // -------------------------------------------------

    draw_sprite_ext(
        item.sprite,
        item.frame,
        65,
        yy,
        escala,
        escala,
        0,
        c_white,
        alpha
    );


    // -------------------------------------------------
    // NOME
    // -------------------------------------------------

    draw_set_font(fnt_dialogo);
    draw_set_alpha(alpha);

    draw_text(
        115,
        yy - 20,
        item.nome
    );


    // -------------------------------------------------
    // PREÇO
    // -------------------------------------------------

    draw_text(
        115,
        yy + 4,
        "$ " + string(scr_PrecoLoja(itensLoja[indice]))
    );


    draw_set_alpha(1);
}


// =====================================================
// MOEDAS
// =====================================================

draw_set_colour(c_black);
draw_set_alpha(0.75);

draw_rectangle(
    1000,
    20,
    1135,
    65,
    false
);

draw_set_alpha(1);
draw_set_colour(c_white);

draw_set_halign(fa_right);
draw_set_font(fnt_dialogo);

draw_text(
    1115,
    30,
    string(global.dinheiro)
);

draw_set_halign(fa_left);


// =====================================================
// VENDEDOR
// =====================================================

if (instance_exists(vendedor))
{
    draw_sprite_ext(
        vendedor.sprite_index,
        vendedor.image_index,
        vendedorX,
        vendedorY,
        1,
        1,
        0,
        c_white,
        1
    );
}


// =====================================================
// BALÃO DE FALA
// =====================================================

if (
    falaTimer > 0
    && fala != ""
)
{
    var balaoX = vendedorX;
    var balaoY = 125;

    draw_sprite_ext(
        spr_balaoFala,
        0,
        balaoX,
        balaoY,
        1,
        1,
        0,
        c_white,
        1
    );


    draw_set_font(fnt_dialogo);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text_ext(
        balaoX,
        balaoY,
        fala,
        4,
        260
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


// =====================================================
// BARRA DE COMPRA
// =====================================================

if (comprando)
{
    var progresso =
        tempoSegurando / tempoCompra;

    progresso = clamp(
        progresso,
        0,
        1
    );


    var barraX = 520;
    var barraY = 430;
    var barraLargura = 400;
    var barraAltura = 12;


    // Fundo
    draw_set_colour(c_black);
    draw_set_alpha(0.7);

    draw_rectangle(
        barraX,
        barraY,
        barraX + barraLargura,
        barraY + barraAltura,
        false
    );


    // Progresso
    draw_set_colour(c_white);
    draw_set_alpha(1);

    draw_rectangle(
        barraX,
        barraY,
        barraX + barraLargura * progresso,
        barraY + barraAltura,
        false
    );
}


// =====================================================
// TEXTO DE CONTROLE
// =====================================================

draw_set_font(fnt_dialogo);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_text(
    730,
    470,
    "Segure o botão esquerdo ou E para comprar"
);

draw_text(
    730,
    490,
    "ESC para sair"
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);