draw_sprite(spr_vinheta,0,0,0)
draw_set_colour(c_white)
draw_set_alpha(flash)
draw_rectangle(0,0,1366,768,0)
draw_set_alpha(1)

transition = lerp(transition, transitionGoal, 0.2)

if (abs(transition - transitionGoal) < 0.1){
    transition = transitionGoal;
}else{
	alarm[1] = 5
}

draw_sprite_ext(spr_escurao,0,683,384,1,1,0,c_white,transition)

if !instance_exists(obj_jogador) exit

alphaVida = clamp((global.saudeMax * 0.5 - global.saude) / (global.saudeMax * 0.5), 0, 1);
draw_sprite_ext(spr_vinheta, 0, 0, 0, 1, 1, 0, c_white, alphaVida);
draw_sprite_ext(spr_vinhetaVermelha, 0, 0, 0, 1, 1, 0, c_white, vinhetaVermelha);
