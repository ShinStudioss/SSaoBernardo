if instance_exists(obj_dialogBox) exit

if global.pause = false{
	draw_set_alpha(0.4);
	draw_set_color(c_black);
	draw_rectangle(24,10,534,140,false);
	draw_set_alpha(1);

	draw_sprite(spr_hudIcon, 0, 32, 25);
	draw_healthbar(74,25,493,56,(disp_saude/global.saudeMax) * 100,make_color_rgb(31, 7, 6),make_color_rgb(51, 22, 3),make_color_rgb(130, 35, 31),0,1,0);
	draw_sprite_stretched(spr_bar, 0, 74, 25, 420, 32);

	draw_sprite(spr_hudIcon, 1, 32, 60);
	draw_healthbar(74,60,493,91,(disp_energia/global.energiaMax) * 100,make_color_rgb(11, 31, 6),make_color_rgb(20, 36, 17),make_color_rgb(58, 112, 45),0,1,0);
	draw_sprite_stretched(spr_bar, 0, 74, 60, 420, 32);

	draw_sprite(spr_hudIcon, 2, 32, 95);
	draw_healthbar(74,95,493,126,(disp_fome/global.fomeMax) * 100,make_color_rgb(40, 41, 8),make_color_rgb(56, 53, 30),make_color_rgb(193, 196, 96),0,1,0);
	draw_sprite_stretched(spr_bar, 0, 74, 95, 420, 32);

	draw_set_color(c_white);

	draw_set_font(fnt_minor)
	draw_set_halign(fa_center);
	draw_set_valign(fa_top)
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
	
	if keyboard_check(vk_control){
		draw_text(50,300,fps)
	}
}
