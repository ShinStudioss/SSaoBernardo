var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Posição do card
var larguraTotal = 6 * largura + 5 * espaco;

var cardX = (display_get_gui_width() - larguraTotal) / 2
          + shopId * (largura + espaco);

var cardY = 96;

var mouseSobre = point_in_rectangle(
    mx,
    my,
    cardX,
    cardY,
    cardX + largura,
    cardY + altura
);

if (mouseSobre)
{
    escalaAlvo = 1.2;

    if (shopId != 5)
        obj_comercio.descricaoTexto = item.descricao;
}
else
{
    escalaAlvo = 1;
}

escala = lerp(escala, escalaAlvo, 0.15);