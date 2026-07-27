event_inherited()
scr_criarParticula(x,y,depth+1,spr_particulaFogo,0,0,0.08)
speed = random_range(14,18) * sign(obj_jogador.xScaleReal)
direction = random_range(-20,20) * sign(obj_jogador.xScaleReal)
alarm[0] = random_range(5,15)

if (global.hora > 18 and global.hora < 23) or (global.hora > 00 and global.hora < 5){
}
else{
	intensity = 0
	radius = 0
}

image_blend = make_color_rgb(30,30,30)