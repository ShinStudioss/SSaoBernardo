var caller = caixaPai.caller;

audio_stop_sound(snd_menuConfirm)
audio_play_sound(snd_menuConfirm,2,0)

instance_destroy(caixaPai)
global.pause = false

switch selectedOption.action{

    case "dormir":
        criar_dialogo(["Raimundo deitou, encerrando seu trabalho por hoje."],false,{})
        instance_create_depth(x,y,depth,obj_transicaoDormir)
    break;
        
    case "colocarbalde":
	if scr_buscarItem(1) != noone{
		scr_removerItem(1, 1);
		scr_buscarItem(1).animPlay = false
	    caller.state = "vazio"
		audio_play_sound(snd_equipe,3,0)
		caller.image_xscale = random_range(1.5,2)
		caller.image_yscale = random_range(1.5,2)
		caller.image_angle = random_range(-60,60)
	}else{
		criar_dialogo(["Você não tem baldes com você."],0,{})
	}
	break;

	case "cortarcasca":
		if scr_buscarItem(3) != noone{
			scr_buscarItem(3).animPlay = false
	        caller.state = "corte"
			caller.alarm[0] = 2
			caller.image_xscale = random_range(1.5,2)
			caller.image_yscale = random_range(1.5,2)
			caller.image_angle = random_range(-60,60)
		}else{
			criar_dialogo(["Você precisa de uma faca para cortar a casca."],0,{})
		}
	break;
        
    case "cancel":
        instance_destroy()
    break;
}