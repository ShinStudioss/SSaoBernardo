if (lojaEstado == 0){
	// Desenha o sprite e o "Clique para interagir" do obj_interagivel,
	// restaurando o estado de desenho que o pai deixa alterado.
	var _fonte = draw_get_font()
	var _halign = draw_get_halign()
	var _valign = draw_get_valign()
	var _cor = draw_get_color()
	event_inherited()
	draw_set_font(_fonte)
	draw_set_halign(_halign)
	draw_set_valign(_valign)
	draw_set_color(_cor)
}
else{
	draw_self()
}
 