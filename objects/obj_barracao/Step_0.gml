image_index = 2
if obj_jogador.x >= room_width/3{
	image_alpha = lerp(image_alpha,0,0.2)
}else{
	image_alpha = lerp(image_alpha,1,0.2)
}

global.pause = 1

//lojaEstado 1 = Entrando na loja
//lojaEstado 2 = Operando
//lojaEstado 3 = Saindo
if lojaEstado = 1{
	obj_jogador.speed = global.maxSpeed
	obj_jogador.sprite_index = spr_jogadorAndando
}
if lojaEstado = 2{
	obj_jogador.speed = 0
	obj_jogador.sprite_index = spr_jogadorParado
}
if lojaEstado = 3{
	obj_jogador.speed = -global.maxSpeed
	obj_jogador.sprite_index = spr_jogadorAndando
	obj_jogador.xScaleReal = -1
}
depth = obj_jogador.depth +1

if obj_jogador.x >= (50+room_width)/2 and lojaEstado = 1{
	lojaEstado = 2
	alarm[0] = 90
}

global.pause = true