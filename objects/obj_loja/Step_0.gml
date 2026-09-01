// =====================================================
// OBJ_LOJA - STEP
// =====================================================


// =====================================================
// CONTROLES
// =====================================================

keybinds = scr_getBinds();


// =====================================================
// FECHAR COM ESC
// =====================================================

if (keyboard_check_pressed(vk_escape))
{
    instance_destroy();
    exit;
}


// =====================================================
// NAVEGAÇÃO
// =====================================================

// Só permite mudança por teclado enquanto não estamos
// no meio de uma compra.

if (!comprando)
{
    if (keyboard_check_pressed(keybinds.up))
    {
        itemSelecionado--;

        if (itemSelecionado < 0)
        {
            itemSelecionado = array_length(itensLoja) - 1;
        }

        audio_stop_sound(snd_menuHover);
        audio_play_sound(snd_menuHover, 2, 0);
    }


    if (keyboard_check_pressed(keybinds.down))
    {
        itemSelecionado++;

        if (itemSelecionado >= array_length(itensLoja))
        {
            itemSelecionado = 0;
        }

        audio_stop_sound(snd_menuHover);
        audio_play_sound(snd_menuHover, 2, 0);
    }
}


// =====================================================
// POSIÇÃO DO MOUSE
// =====================================================

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

mouseSobreItem = false;
mouseOffset = 0;


// =====================================================
// DETECTAR ITEM CLICÁVEL
// =====================================================

var meio = floor(quantidadeVisivel / 2);

for (var offset = -meio; offset <= meio; offset++)
{
    var indice = scr_wrap(
        itemSelecionado + offset,
        0,
        array_length(itensLoja) - 1
    );

    var yy = centroRodaY + offset * espacamentoItens;

    var esquerda = 35;
    var direita = 310;

    var topo = yy - 28;
    var baixo = yy + 28;


    if (
        point_in_rectangle(
            mx,
            my,
            esquerda,
            topo,
            direita,
            baixo
        )
    )
    {
        mouseSobreItem = true;
        mouseOffset = offset;

        // Só seleciona quando o jogador clicar.
        if (
            mouse_check_button_pressed(mb_left)
            && !comprando
        )
        {
            itemSelecionado = indice;

            audio_stop_sound(snd_menuHover);
            audio_play_sound(snd_menuHover, 2, 0);
        }

        break;
    }
}


// =====================================================
// INICIAR / CONTINUAR COMPRA
// =====================================================

// Mouse:
// precisa estar sobre um item.
//
// Teclado:
// E funciona como equivalente à interação.

var mouseComprando =
    mouse_check_button(mb_left)
    && mouseSobreItem;

var tecladoComprando =
    keyboard_check(keybinds.interact);


// -----------------------------------------------------
// Se nenhum dos dois estiver sendo segurado
// -----------------------------------------------------

if (!mouseComprando && !tecladoComprando)
{
    comprando = false;
    tempoSegurando = 0;
    compraArmada = true;
}


// -----------------------------------------------------
// Começa / continua a compra
// -----------------------------------------------------

if (
    (mouseComprando || tecladoComprando)
    && compraArmada
)
{
    comprando = true;
    tempoSegurando++;
}


// =====================================================
// FINALIZAR TENTATIVA DE COMPRA
// =====================================================

if (
    comprando
    && tempoSegurando >= tempoCompra
)
{
    // Impede várias compras enquanto o botão continua
    // pressionado.
    compraArmada = false;

    comprando = false;
    tempoSegurando = 0;


    // -------------------------------------------------
    // ITEM
    // -------------------------------------------------

    var idItem = itensLoja[itemSelecionado];

    var preco = scr_PrecoLoja(idItem);


    // -------------------------------------------------
    // A VERIFICAÇÃO DO DINHEIRO SÓ ACONTECE AQUI
    // -------------------------------------------------

    if (global.dinheiro >= preco)
    {
        // -------------------------------------------------
        // TENTA ADICIONAR AO INVENTÁRIO
        // -------------------------------------------------

        if (scr_addItem(idItem, 1))
        {
            // Só desconta depois que o item foi adicionado.
            global.dinheiro -= preco;


            // -------------------------------------------------
            // FALA DO VENDEDOR
            // -------------------------------------------------

            fala =
                falasCompra[
                    irandom(
                        array_length(falasCompra) - 1
                    )
                ];

            falaTimer = falaDuracao;


            // -------------------------------------------------
            // SOM
            // -------------------------------------------------

            audio_stop_sound(snd_menuConfirm);
            audio_play_sound(snd_menuConfirm, 2, 0);
        }
        else
        {
            // Inventário cheio.

            fala =
                falasInventarioCheio[
                    irandom(
                        array_length(falasInventarioCheio) - 1
                    )
                ];

            falaTimer = falaDuracao;
        }
    }
    else
    {
        // -------------------------------------------------
        // DINHEIRO INSUFICIENTE
        // -------------------------------------------------

        fala =
            falasSemDinheiro[
                irandom(
                    array_length(falasSemDinheiro) - 1
                )
            ];

        falaTimer = falaDuracao;
    }
}


// =====================================================
// BALÃO
// =====================================================

if (falaTimer > 0)
{
    falaTimer--;
}