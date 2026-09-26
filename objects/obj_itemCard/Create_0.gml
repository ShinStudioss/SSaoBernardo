item = scr_getItem(obj_comercio.itemPool[shopId])
// ID do item na loja
largura = 192;
altura = 160;
espaco = 16;

var larguraTotal = 6 * largura + 5 * espaco;

x = (display_get_gui_width() - larguraTotal) / 2
    + shopId * (largura + espaco);

y = 96;

escala = 1;
escalaAlvo = 1;

if (shopId == 5)
{
    nome = "Encerrar\nnegociações";
}

