if sprite_index != spr_jogadorAtacando{
	draw_self()
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
	itemX = lerp(itemX,x+10,0.1)
	itemY = lerp(itemY,y,0.1)
	draw_sprite_ext(spr_item,_item.frame,itemX,itemY,0.7,0.7,0,c_white,1)
}
else{
	itemX = x-20
	itemY = y+20
}