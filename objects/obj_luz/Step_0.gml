if global.daytime = "noite"{
	image_alpha = 1
	depth = -99999
	x = obj_jogador.x
	y = obj_jogador.y
	layer_set_visible("lay_vinhetaNoite",1)
	layer_set_visible("lay_vinhetaDia",0)
	layer_set_visible("lay_noite",1)
}

else{
	image_alpha = 0
	layer_set_visible("lay_vinhetaDia",1)
	layer_set_visible("lay_vinhetaNoite",0)
	layer_set_visible("lay_noite",0)
}

