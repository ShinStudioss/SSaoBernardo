draw_self()
var distancia = distance_to_object(obj_jogador);

if (distancia < 40) and !instance_exists(obj_dialogBox){
	draw_set_font(fnt_interacoes)
	draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
	draw_set_color(c_white);
    draw_text(x, y - 40, "[E] para interagir");
}