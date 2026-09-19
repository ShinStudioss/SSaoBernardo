if drawVinheta = true{
	draw_sprite(spr_vinheta, 0, 0, 0);
}

draw_set_colour(c_white);
draw_set_alpha(flash);
draw_rectangle(0, 0, 1366, 768, false);
draw_set_alpha(1);


// Transição
transition = lerp(transition, transitionGoal, 0.2);

if (abs(transition - transitionGoal) < 0.01) {
    transition = transitionGoal;
} else {
    alarm[1] = 5;
}


// Escurecer tela
draw_set_colour(c_black);
draw_set_alpha(transition);
draw_rectangle(0, 0, 1366, 768, false);
draw_set_alpha(1);


if (!instance_exists(obj_jogador))
    exit;


// Vinheta de vida
alphaVida = clamp(
    (global.saudeMax * 0.5 - global.saude) / (global.saudeMax * 0.5),
    0,
    1
);

draw_sprite_ext(
    spr_vinheta,
    0,
    0,
    0,
    1,
    1,
    0,
    c_white,
    alphaVida
);

draw_sprite_ext(
    spr_vinhetaVermelha,
    0,
    0,
    0,
    1,
    1,
    0,
    c_white,
    vinhetaVermelha
);