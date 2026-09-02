draw_self()

if state != "aceso"{
	event_inherited();
}

var valor = (quantidade/quantidadeMax) * 100

if state = "aceso"{
	if quantidade < quantidadeMax{
		quantidade += 1
	}else{
		image_xscale = random_range(1.5,2)
		image_yscale = random_range(1.5,2)
		image_angle = random_range(-60,60)
		scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaLatex,10,0.03,0.1)
		state = "pronto"
	}
	draw_healthbar(x-30,y+20,x+30,y+23,valor,make_colour_rgb(20,20,20),c_white,c_white,0,true,true)
}