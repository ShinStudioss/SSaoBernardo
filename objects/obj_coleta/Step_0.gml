keybinds = scr_getBinds()

depth = obj_jogador.depth + 1

event_inherited()

var dialogo;

switch state{
    case "sembalde":
	if global.itemSelecionado == scr_buscarItem(1).arrayPos and distancia < 70{
		image_alpha = 0.3 + sin(current_time / 200) * 0.5;
		image_index = 2
	}
	else{
		image_alpha = 0
	}
		
	break;

    case "vazio":
        image_alpha = 1
        image_index = 1
	break;
	
	case "cheio":
		image_index = 0
	break
}

if (distancia < 70 && cima) && !instance_exists(obj_dialogBox){
    switch state{
	    case "sembalde":
	        image_alpha = 0
			if scr_buscarItem(1) != noone{
				if global.itemSelecionado == scr_buscarItem(1).arrayPos{
					scr_Emote(spr_jogadorItem)
					scr_buscarItem(1).animPlay = false
					scr_removerItem(1, 1);
					scr_freeze(120)
					scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaPontoPreto,10,0.03,0.1)
					audio_play_sound(snd_equipe,3,0,0.3,,random_range(1.1,1.4))
					audio_play_sound(snd_equipe,3,0,0.3,,random_range(0.7,0.9))
					audio_play_sound(snd_damage,3,0,1,,0.8)
					image_xscale = random_range(1.5,2)
					image_yscale = random_range(1.5,2)
					image_angle = random_range(-60,60)
					state = "vazio"
				}
			}
			else{
				scr_Emote(spr_jogadorNao)
				criar_dialogo(["É necessário um balde para extrair látex. Você não tem baldes com você."],0,{})
			}
		break;

	    case "vazio":
	        image_alpha = 1
	        image_index = 1
			if scr_buscarItem(3) != noone{
				if global.itemSelecionado == scr_buscarItem(3).arrayPos{
					scr_buscarItem(3).animPlay = false
					alarm[0] = 18
					scr_Emote(spr_jogadorAtacando)
					obj_jogador.attackItem = spr_facaDeSangria
					image_xscale = random_range(1.5,2)
					image_yscale = random_range(1.5,2)
					image_angle = random_range(-60,60)
				}
			}
			else{
				scr_Emote(spr_jogadorNao)
				criar_dialogo(["Para fazer uma abertura, é necessário uma faca de sangria. Você precisa de uma faca para cortar a casca."],0,{})
			}
		break;
	
		case "cheio":
			image_index = 0
			scr_Emote(spr_jogadorSim)
			scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaLatex,10,0.03,0.1)
			scr_addItem(2,1) quantidade = 0 state = "sembalde"
		break
	}
}

image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
image_angle = lerp(image_angle,1,0.3)
dripFrame += 0.1166667