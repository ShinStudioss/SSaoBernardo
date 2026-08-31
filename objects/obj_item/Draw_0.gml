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

if (distance_to_object(obj_jogador) < 90) and !instance_exists(obj_dialogBox){
	draw_set_font(fnt_interacoes)
	draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
	draw_set_color(c_white);
    draw_text(x, y - 40, "Clique para interagir");
}