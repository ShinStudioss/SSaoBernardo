var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);


// =====================================================
// POSIÇÃO DO CARD
// =====================================================

var larguraTotal = 6 * largura + 5 * espaco;

var cardX = (display_get_gui_width() - larguraTotal) / 2
          + shopId * (largura + espaco);

var cardY = 96;


// =====================================================
// VERIFICA SE O MOUSE ESTÁ SOBRE O CARD
// =====================================================

var mouseSobre = point_in_rectangle(
    mx,
    my,
    cardX,
    cardY,
    cardX + largura,
    cardY + altura
);


// =====================================================
// MOUSE SOBRE O CARD
// =====================================================

if (mouseSobre)
{
    escalaAlvo = 1.2;


    // =================================================
    // CARD DE ITEM
    // =================================================

    if (shopId != 5)
    {
        // -------------------------------------------------
        // VERIFICA DINHEIRO
        // -------------------------------------------------

        var temDinheiro = global.dinheiro >= item.preco;


        // -------------------------------------------------
        // VERIFICA ESPAÇO NO INVENTÁRIO
        // -------------------------------------------------

        var temEspaco = false;


        // Verifica se o item já existe para stackar
        for (var i = 0; i < array_length(global.inventario); i++)
        {
            if (global.inventario[i][0] == shopId)
            {
                temEspaco = true;
                break;
            }
        }


        // Se não existe, procura um slot vazio
        if (!temEspaco)
        {
            for (var i = 0; i < array_length(global.inventario); i++)
            {
                if (global.inventario[i][0] == 0)
                {
                    temEspaco = true;
                    break;
                }
            }
        }


        // -------------------------------------------------
        // VERIFICA SE PODE COMPRAR
        // -------------------------------------------------

        var podeComprar = temDinheiro && temEspaco;


        if (!podeComprar)
        {
            escalaAlvo = 1;
        }


        // =================================================
        // DIÁLOGO DO ITEM
        // =================================================

        var precisaCriarDialogo = true;


        // Verifica se já existe uma caixa de diálogo
        if (instance_exists(obj_dialogBox))
        {
            // Se a caixa existente foi criada para um item
            // e é o mesmo item, não recria.
            if (variable_instance_exists(obj_dialogBox, "comercioItemId"))
            {
                if (obj_dialogBox.comercioItemId == shopId)
                {
                    precisaCriarDialogo = false;
                }
                else
                {
                    // É outro item: destrói a caixa anterior
                    with (obj_dialogBox)
                    {
                        instance_destroy();
                    }

                    global.pause = false;
                }
            }
            else
            {
                // Existe uma caixa que não pertence à loja.
                // Como estamos entrando na descrição de um item,
                // ela deve ser destruída antes de criar a nova.
                with (obj_dialogBox)
                {
                    instance_destroy();
                }

                global.pause = false;
            }
        }


        // =================================================
        // CRIA O DIÁLOGO
        // =================================================

        if (precisaCriarDialogo)
        {
            // Formata o preço:
            // 15.00 -> 15,00
            var precoTexto = string_format(item.preco, 2, 2);
            precoTexto = string_replace_all(precoTexto, ".", ",");


            // Nome + descrição
            // Exemplo:
            // Poronga: Lamparina tradicional dos seringueiros.
            //
            // Preço: R$15,00

            var textoItem =
                item.nome + ": " + item.descricao
                + "\n\nPreço: R$" + precoTexto;

			var _dialogo = criar_dialogo(
                [textoItem],
                false,[],,,999,999
            );
			_dialogo.skippable = false


            // Identifica que esta caixa pertence
            // ao card atual.
            if (instance_exists(obj_dialogBox))
            {
                obj_dialogBox.comercioItemId = shopId;
            }
        }


        // =================================================
        // COMPRA
        // =================================================

        if (mouse_check_button_pressed(mb_left) && podeComprar)
        {
            // Tenta adicionar o item correto ao inventário
            var adicionou = scr_addItem(shopId, 1);


            // Só cobra se o item realmente entrou
            if (adicionou)
            {
                global.dinheiro -= item.preco;


                // Remove o item da loja
                obj_comercio.itemPool[shopId] = 0;


                // Remove o card
                instance_destroy();
            }
        }
    }
}
else
{
    escalaAlvo = 1;
}


// =====================================================
// ANIMAÇÃO DA ESCALA
// =====================================================

escala = lerp(escala, escalaAlvo, 0.15);