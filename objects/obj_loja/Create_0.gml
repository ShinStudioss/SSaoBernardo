// =====================================================
// OBJ_LOJA - CREATE
// =====================================================


// =====================================================
// REFERÊNCIA DO VENDEDOR
// =====================================================

if (!variable_instance_exists(id, "vendedor"))
{
    vendedor = noone;
}


// =====================================================
// PAUSA
// =====================================================

global.pause = true;


// =====================================================
// CONTROLES
// =====================================================

keybinds = scr_getBinds();


// =====================================================
// ITENS DA LOJA
// =====================================================

// Por enquanto, a loja possui todos os itens 1 até 20.
//
// Depois você pode trocar esse array por:
//
// itensLoja = [1, 3, 4, 6, 13];
//
// sem precisar alterar o sistema da loja.

itensLoja = [];

for (var i = 1; i <= 20; i++)
{
    array_push(itensLoja, i);
}


// =====================================================
// ITEM SELECIONADO
// =====================================================

itemSelecionado = 0;


// =====================================================
// COMPRA
// =====================================================

tempoCompra = 90;

// Tempo segurando o botão.
tempoSegurando = 0;

comprando = false;

// Depois de uma tentativa de compra,
// exige que o jogador solte o botão antes
// de outra tentativa.
compraArmada = true;


// =====================================================
// MOUSE
// =====================================================

mouseSobreItem = false;
mouseOffset = 0;


// =====================================================
// VISUAL DA LOJA
// =====================================================

quantidadeVisivel = 7;
espacamentoItens = 62;

centroRodaX = 170;
centroRodaY = 300;


// =====================================================
// VENDEDOR
// =====================================================

vendedorX = 720;
vendedorY = 300;


// =====================================================
// MOEDAS
// =====================================================

moedaX = 1100;
moedaY = 35;


// =====================================================
// BALÃO
// =====================================================

fala = "";
falaTimer = 0;

falaDuracao = 120;

falasCompra = [
    "Boa escolha!",
    "Excelente negócio!",
    "Isso vai ser útil.",
    "Por que não levar dois?",
    "Obrigado pela compra!",
    "Vai precisar disso na mata.",
    "Boa viagem!"
];

falasSemDinheiro = [
    "Você não tem dinheiro suficiente.",
    "Volte quando tiver mais dinheiro.",
    "Está faltando dinheiro.",
    "Esse item custa mais do que você tem."
];

falasInventarioCheio = [
    "Sua mochila está cheia.",
    "Você não tem espaço para isso.",
    "Arrume espaço primeiro.",
    "Não consigo colocar isso aí."
];


// =====================================================
// CAIXA DE DESCRIÇÃO
// =====================================================

caixaDialogo = instance_create_depth(
    0,
    0,
    99999,
    obj_dialogBox,
    {
        modoLoja: true,
        loja: id,

        // Variáveis exigidas pelo obj_dialogBox normal.
        caller: id,
        textArray: [""],
        options: false,
        optionsStruct: [],
        zoomAmount: 1,
        voz: snd_rabiscoVoz,
        textSpeed: 0,
        voiceFrequency: 999
    }
);


// =====================================================
// SOM DE ABERTURA
// =====================================================

audio_stop_sound(snd_menuHover);
audio_play_sound(snd_menuHover, 2, 0);