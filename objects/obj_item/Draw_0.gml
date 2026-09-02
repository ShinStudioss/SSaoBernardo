var rotation = current_time / 1000 * 20;

draw_sprite_ext(
    sprite_index,
    image_index,
    x, y,
    image_xscale, image_yscale,
    rotation,
    c_white,
    0.5
);

var alpha_wave = lerp(0.2, 0.8, (sin(current_time / 1000) + 1) / 2);

draw_sprite_ext(
    sprite_index,
    image_index,
    x, y,
    image_xscale, image_yscale,
    0,
    c_white,
    alpha_wave
);

intensity = 0.30 + alpha_wave

// 1. Encontra qual é a instância de 'obj_item' MAIS PERTO do jogador
var _item_mais_proximo = instance_nearest(obj_jogador.x, obj_jogador.y, obj_item);

// 2. Só desenha se ESTE objeto for o mais próximo de todos
if (id == _item_mais_proximo) {
    if (distance_to_object(obj_jogador) < 90) and !instance_exists(obj_dialogBox) {
        draw_set_font(fnt_interacoes);
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_set_color(c_white);
        draw_text(x, y - 40, "Pegar");
    }
}

