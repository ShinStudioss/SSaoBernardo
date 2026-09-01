keybinds = scr_getBinds()

depth = obj_jogador.depth + 1

event_inherited()

var dialogo;

var dialogoSeringueira = [
	"Uma defumadora. É aqui que o látex é transformado em borracha.",
	"É preciso lenha para acender. Após isso, basta por o látex e iniciar o processo."
];

switch state{
    case "semlenha":
		if scr_buscarItem(21) != noone{
	        if global.itemSelecionado == scr_buscarItem(21).arrayPos and distancia < 70{
				image_alpha = 1 + sin(current_time / 200) * 0.3


				if (sin(current_time / 200) >= 0) {
				    image_index = 2;
				} else {
				    image_index = 0;
				}

	        }
	        else{
	            image_alpha = 1
				image_index = 0
	        }
		}
		else{
	            image_alpha = 1
				image_index = 0
	    }
    break;

    case "comlenha":
        image_alpha = 1
        image_index = 1
    break;
    
    case "pronto":
        image_index = 0
    break
}

// INTERAÇÃO PRINCIPAL
if (distancia < 70 && cima) && !instance_exists(obj_dialogBox){
    switch state{

        case "semlenha":
            image_alpha = 0

            if scr_buscarItem(21) != noone{
                if global.itemSelecionado == scr_buscarItem(21).arrayPos{

                    scr_Emote(spr_jogadorItem)
                    scr_buscarItem(21).animPlay = false
                    scr_removerItem(21, 1);
                    scr_freeze(120)
                    scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaPontoPreto,10,0.03,0.1)

                    audio_play_sound(snd_equipe,3,0,0.3,,random_range(1.1,1.4))
                    audio_play_sound(snd_equipe,3,0,0.3,,random_range(0.7,0.9))
                    audio_play_sound(snd_porongaApagando,3,0,1,,0.8)

                    image_xscale = random_range(1.5,2)
                    image_yscale = random_range(1.5,2)
                    image_angle = random_range(-60,60)

                    state = "comlenha"
                }
                else{
                    scr_Emote(spr_jogadorNao)
                    criar_dialogo(dialogoSeringueira,0,{})
                }
            }
            else{
                scr_Emote(spr_jogadorNao)
                criar_dialogo(["É necessário lenha para defumar o látex. Você não tem lenha com você."],0,{})
            }
        break;

        case "comlenha":

            image_alpha = 1
            image_index = 1

            if scr_buscarItem(2) != noone{
                if global.itemSelecionado == scr_buscarItem(2).arrayPos{

                    scr_buscarItem(2).animPlay = false
                    alarm[0] = 13

                    image_xscale = random_range(1.5,2)
                    image_yscale = random_range(1.5,2)
                    image_angle = random_range(-60,60)
                }
                else{
                    scr_Emote(spr_jogadorNao)
                    criar_dialogo(dialogoSeringueira,0,{})
                }
            }
            else{
                scr_Emote(spr_jogadorNao)
                criar_dialogo(["Você não tem látex. É preciso látex para defumar látex."],0,{})
            }

        break;
    
        case "pronto":
            image_index = 0
            scr_Emote(spr_jogadorSim)
            scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaLatex,10,0.03,0.1)

            scr_addItem(7,1)
            quantidade = 0
            state = "semlenha"
        break
    }
}

image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
image_angle = lerp(image_angle,1,0.3)

dripFrame += 0.1166667