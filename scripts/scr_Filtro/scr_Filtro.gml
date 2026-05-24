function filtro_cor_set(_cor, _intensidade)
{
    global.filtro_r = colour_get_red(_cor) / 255;
    global.filtro_g = colour_get_green(_cor) / 255;
    global.filtro_b = colour_get_blue(_cor) / 255;

    global.filtro_intensidade = clamp(_intensidade, 0, 1);
}