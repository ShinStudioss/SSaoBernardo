// =====================================================
// OBJ_DIALOGBOX - DRAW GUI
// =====================================================


// =====================================================
// MODO LOJA
// =====================================================

if (modoLoja)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);


    // -------------------------------------------------
    // CAIXA
    // -------------------------------------------------

    draw_set_colour(c_black);
    draw_set_alpha(0.85);

    draw_rectangle(
		    40,
		    495,
		    1112,
		    635,
		    false
);


    draw_set_colour(c_white);
    draw_set_alpha(1);


    // -------------------------------------------------
    // ITEM ATUAL
    // -------------------------------------------------

    if (instance_exists(loja))
    {
        var idAtual =
            loja.itensLoja[
                loja.itemSelecionado
            ];

        var itemAtual =
            scr_getItem(idAtual);

        var precoAtual =
            scr_PrecoLoja(idAtual);


        // Nome
        draw_set_font(fnt_dialogo);

        draw_text(
            70,
            515,
            itemAtual.nome
        );


        // Preço
        draw_text(
            70,
            555,
            "Preço: $ "
            + string(precoAtual)
        );


        // Descrição
        draw_text_ext(
            310,
            515,
            itemAtual.descricao,
            4,
            760
        );
    }


    // Não deixa o código normal do diálogo executar.
    exit;
}


// =====================================================
// DIÁLOGO NORMAL
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour(c_black);

draw_sprite(
    spr_cutsceneBars,
    0,
    0,
    0
);

draw_set_alpha(0.6);

draw_rectangle(
    64 - stretchLerp,
    500 - stretchLerp / 2,
    1302 + stretchLerp,
    680 + stretchLerp / 2,
    0
);

draw_set_colour(c_white);
draw_set_alpha(1);

draw_set_font(fnt_dialogo);


var currentText =
    textArray[textArrayIndex];

var visibleText =
    string_copy(
        currentText,
        1,
        charIndex
    );


draw_text_ext(
    88,
    524,
    visibleText,
    36,
    1200
);


// IMPORTANTE:
// comparação deve ser == e não =

if (
    options
    && currentText == ""
)
{
    if (!instance_exists(obj_escolha))
    {
        instance_create_depth(
            x,
            y,
            depth,
            obj_escolha,
            {
                caixaPai: id
            }
        );
    }


    draw_text_ext(
        88,
        524,
        optionsStruct[0].text,
        36,
        1200
    );


    draw_text_ext(
        88,
        524
            + string_height_ext(
                optionsStruct[0].text,
                36,
                1200
            ),
        optionsStruct[1].text,
        36,
        1200
    );
}