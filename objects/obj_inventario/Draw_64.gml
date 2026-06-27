if instance_exists(obj_dialogBox) exit
draw_sprite_ext(spr_inventario,2,x,y,1,1,0,c_white,effectAlpha)

draw_self()

draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(fnt_minor)
//draw_text(x+24,y-24,arrayPos+1)

var selecionado = (global.itemSelecionado == arrayPos);

if (selecionado && !selecionadoAntes) || animPlay == false
{
	escala = 2;
	effectAlpha = 1;
	audio_play_sound(snd_menuHover,4,0);
	animPlay = true;
}

if (selecionado)
{
	draw_sprite(spr_inventario,1,x,y);
}

selecionadoAntes = selecionado;

itemInfo = scr_getItem(item)
draw_sprite_ext(itemInfo.sprite,itemInfo.frame,x,y,escala,escala,rotacao,c_white,1)
if quantidade > 1{
	draw_text(x+16,y+16,"x" + string(quantidade))
}
draw_set_halign(fa_left);
draw_set_valign(fa_top)
if global.itemSelecionado == arrayPos{
	draw_text(32,room_height-32,itemInfo.nome)
}
draw_set_halign(fa_middle)
draw_set_valign(fa_center)

escala = lerp(escala,1,0.1)
effectAlpha = lerp(effectAlpha,0,0.05)

if item = 5{
	draw_healthbar(x-24,y+32,x+24,y+34,(global.combustivelPoronga/300)*100,c_black,c_red,c_lime,0,1,1)
}