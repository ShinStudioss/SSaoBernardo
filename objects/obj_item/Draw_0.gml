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