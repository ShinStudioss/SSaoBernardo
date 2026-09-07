if current_time%2 = 0{
	scr_criarParticula(x+random_range(-48,48),y+64,depth+5,spr_particulaNuvemPreta,90,random_range(1,3),0.001)
}
draw_sprite(sprite_index,0,x,y)

if state != "comlatex"{
	event_inherited();
}

var valor = (quantidade/quantidadeMax) * 100

if state = "comlatex"{
	frame = 2
	if quantidade < quantidadeMax{
		quantidade += 1
	}else{
		escalaItem = 2
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
	draw_sprite_ext(spr_item,frame,x,y,escalaItem,escalaItem,image_angle+dripFrame*3,c_white,1)
}

escalaItem = lerp(escalaItem,1,0.2)