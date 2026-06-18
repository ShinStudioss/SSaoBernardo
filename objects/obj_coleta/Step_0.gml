keybinds = scr_getBinds()

depth = obj_jogador.depth + 1

event_inherited()

var dialogo;

switch state{
    case "sembalde":
        image_alpha = 0
		
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
					scr_buscarItem(1).animPlay = false
					scr_removerItem(1, 1);
				    state = "vazio"
					audio_play_sound(snd_equipe,3,0)
					image_xscale = random_range(1.5,2)
					image_yscale = random_range(1.5,2)
					image_angle = random_range(-60,60)
				}
			}
			else{
				criar_dialogo(["Você não tem baldes com você."],0,{})
			}
		break;

	    case "vazio":
	        image_alpha = 1
	        image_index = 1
			if scr_buscarItem(3) != noone{
				if global.itemSelecionado == scr_buscarItem(3).arrayPos{
					scr_buscarItem(3).animPlay = false
			        state = "corte"
					alarm[0] = 2
					image_xscale = random_range(1.5,2)
					image_yscale = random_range(1.5,2)
					image_angle = random_range(-60,60)
				}
			}
			else{
				criar_dialogo(["Você precisa de uma faca para cortar a casca."],0,{})
			}
		break;
	
		case "cheio":
			image_index = 0
			scr_addItem(2,1) quantidade = 0 state = "sembalde"
		break
	}
}

image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
image_angle = lerp(image_angle,1,0.3)