

if global.pause = false{
	draw_healthbar(60,45,480,75,(disp_saude/global.saudeMax) * 100,make_color_rgb(31, 7, 6),make_color_rgb(51, 22, 3),make_color_rgb(130, 35, 31),0,1,0)
	draw_healthbar(60,80,440,90,(disp_energia/global.energiaMax) * 100,make_color_rgb(11, 31, 6),make_color_rgb(20, 36, 17),make_color_rgb(58, 112, 45),0,1,0)
	draw_healthbar(60,95,425,108,(disp_fome/global.fomeMax) * 100,make_color_rgb(40, 41, 8),make_color_rgb(56, 53, 30),make_color_rgb(193, 196, 96),0,1,0)
	draw_sprite(spr_bars,0,x,y)
	draw_self()

	draw_set_font(fnt_minor)

	draw_text(80,room_height-120,"Inventário")
	draw_set_font(fnt_hud)
	
	if device_mouse_x_to_gui(0) < 480 && device_mouse_y_to_gui(0) < 110{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text(
		device_mouse_x_to_gui(0),
		device_mouse_y_to_gui(0),
		"Saúde: "  + string(round(clamp(global.saude,   0, global.saudeMax)))   + "/" + string(round(global.saudeMax))   + "\n" +
		"Energia: "+ string(round(clamp(global.energia, 0, global.energiaMax))) + "/" + string(round(global.energiaMax)) + "\n" +
		"Fome: "   + string(round(clamp(global.fome,    0, global.fomeMax)))    + "/" + string(round(global.fomeMax))
	);
	}
}