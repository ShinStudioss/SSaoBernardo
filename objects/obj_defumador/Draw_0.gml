draw_sprite(sprite_index,0,x,y)

if state != "comlatex"{
	event_inherited();
}

var valor = (quantidade/quantidadeMax) * 100

if state = "comlatex"{
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

if state = "buff"{
	if quantidade < quantidadeMax{
		quantidade += 200
		state = "comlatex"
	}
}

if state != "semlatex"{
	draw_sprite_ext(spr_item,frame,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}