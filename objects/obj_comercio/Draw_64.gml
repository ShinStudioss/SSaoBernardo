if dinheiroEfeitos = true{
	audio_play_sound(snd_moneyPickup,8,0)
	cor = c_yellow
	escala = 2
	rotacao = random_range(-45,45)
	scr_freeze(10)
	shake = 10
	dinheiroEfeitos = false
}

if instance_exists(obj_dialogBox){
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	draw_text_transformed_colour(x,y-shake,"R$" + string(global.dinheiro),escala,escala,rotacao,cor,cor,cor,cor,1)
}