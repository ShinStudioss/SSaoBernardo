draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_sprite_ext(spr_cursor,cursorImage,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if global.pause = false{
	draw_sprite_stretched_ext(spr_inventario,0,device_mouse_x_to_gui(0)+20,device_mouse_y_to_gui(0)-40,string_width(display_text),48,c_white,alpha)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(fnt_interacoes)
	draw_set_colour(c_white)
	draw_set_font(fnt_minor)
	draw_text_colour(device_mouse_x_to_gui(0)+20,device_mouse_y_to_gui(0)-40,display_text,c_white,c_white,c_white,c_white,alpha)
	draw_set_color(c_white)
}

var item_id = global.inventario[global.itemSelecionado][0];
var item = scr_getItem(item_id);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_ext(
    item.sprite,
    item.frame,
    device_mouse_x_to_gui(0) - 16,
    device_mouse_y_to_gui(0) + 16,
	0.6,
	0.6,
	0,c_white,1
);