
randomize()
if npc_tipo = "generico"{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1)
	draw_sprite_ext(spr_npcGenericoOverlay1,overlay[0],x,y,image_xscale,image_yscale,0,c_white,1)
	draw_sprite_ext(spr_npcGenericoOverlay2,overlay[1],x,y,image_xscale,image_yscale,0,c_white,1)
	if temChapeu{
		draw_sprite_ext(spr_npcGenericoChapeu,1,x,y,image_xscale,image_yscale,0,c_white,overlay[2])
	}
}
else{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1)
}