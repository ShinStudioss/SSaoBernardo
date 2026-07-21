if sprite_index != spr_jogadorAtacando{
	var _cor = make_color_rgb(effectColor[0],effectColor[1],effectColor[2])
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_cor,image_alpha)
}
if obj_cursor.alarm[2] < 19{
	effectColor[0] = lerp(effectColor[0],255,0.05)
	effectColor[1] = lerp(effectColor[1],255,0.05)
	effectColor[2] = lerp(effectColor[2],255,0.05)
}
if (scr_buscarItem(5) != noone)
{
	porongaScale = lerp(porongaScale,1,0.2)
    draw_sprite_ext(spr_porongaJogador, image_index, x, y - 72,porongaScale,porongaScale,0,c_white,1);
}

if sprite_index = spr_jogadorAtacando{
	draw_sprite_ext(attackItem,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
}

if sprite_index = spr_jogadorItem{
	var _item = scr_getItem(global.inventario[global.itemSelecionado][0])
	var offX = 10 * image_xscale
    var offY = 0
	itemX = lerp(itemX,x+offX,0.1)
	itemY = lerp(itemY,y+offY,0.1)
	draw_sprite_ext(spr_item,_item.frame,itemX,itemY,0.7*image_xscale,0.7,0,c_white,1)
}
else{
	itemX = x-20*image_xscale
	itemY = y+20
}