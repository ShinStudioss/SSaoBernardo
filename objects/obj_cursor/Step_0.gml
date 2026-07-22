#region Funcionamento do cursor
image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
var mx_gui = device_mouse_x_to_gui(0);
var my_gui = device_mouse_y_to_gui(0);
var cam = view_camera[0];
var mx_room = camera_get_view_x(cam) + (mx_gui / display_get_gui_width()) * camera_get_view_width(cam);
var my_room = camera_get_view_y(cam) + (my_gui / display_get_gui_height()) * camera_get_view_height(cam);
x = mx_room
y = my_room


if display_text != ""{
	alpha = lerp(alpha,1,0.1)
}
else{
	alpha = lerp(alpha,0,0.1)
}

if mouse_check_button(mb_right){
    var item_id = global.inventario[global.itemSelecionado][0];
    display_text = scr_getItem(item_id).descricao;
}
#endregion

#region Uso dos itens
var _item = scr_getItem(global.inventario[global.itemSelecionado][0])

if obj_jogador.pulando == false{
	ataque_ar = true
}

if mouse_check_button_pressed(mb_left){
	if _item.nome != "" and !instance_exists(obj_dialogBox){
		switch _item.nome{
			case "Balde vazio":
				scr_Emote(spr_jogadorItem)
			break;
			
			case "Látex":
				scr_Emote(spr_jogadorItem)
			break;
			
			case "Faca de sangria":
				obj_jogador.attackItem = spr_facaDeSangria
				obj_jogador.damageMulti = 0.8
					
				if obj_jogador.sprite_index != spr_jogadorAtacando and obj_jogador.pulando != true{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada1)
					audio_play_sound(snd_espada1,3,0,,,random_range(0.9,1.2))
					obj_jogador.x += 5 * obj_jogador.image_xscale
				}
				if obj_jogador.sprite_index != spr_jogadorAtacando and ataque_ar == true{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada1)
					audio_play_sound(snd_espada1,3,0,,,random_range(0.9,1.2))
					ataque_ar = false
				}
			break;
			
			case "Poronga":
				scr_Emote(spr_jogadorItem)
				if global.combustivelPoronga > 0{
					audio_play_sound(snd_porongaAcendendo,4,0)
					obj_jogador.porongaScale = 2
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-80,depth+1,360,10,spr_particulaBrilho,13+random_range(-2,2),0.05,0.3)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-80,depth+1,360,10,spr_particulaFogo,13+random_range(-2,2),0.05,0.3)
					scr_freeze(90)
				}
			break;
			
			case "Poronga acesa":
				scr_Emote(spr_jogadorItem)
				audio_play_sound(snd_porongaApagando,4,0)
			break;
			
			case "Querosene":
				audio_play_sound(snd_porongaAcendendo,4,0)
				scr_Emote(spr_jogadorItem)
				obj_jogador.porongaScale = 2
				scr_explosaoParticula(obj_jogador.x,obj_jogador.y-80,depth+1,360,10,spr_particulaBrilho,13+random_range(-2,2),0.05,0.3)
				scr_explosaoParticula(obj_jogador.x,obj_jogador.y-80,depth+1,360,10,spr_particulaFogo,13+random_range(-2,2),0.05,0.3)
				scr_freeze(90)
			break;
			
			case "Bola de borracha":
				scr_Emote(spr_jogadorItem)
			break;
			
			case "Terçado":
				obj_jogador.attackItem = spr_tercado
				obj_jogador.damageMulti = 1.1
					
				if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0 and obj_jogador.pulando != true{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada3)
					audio_stop_sound(snd_porongaApagando)
					audio_play_sound(snd_porongaApagando,5,0,,,0.9)
					audio_play_sound(snd_espada3,3,0,,,random_range(0.9,1.2))
					obj_jogador.x += 10 * obj_jogador.image_xscale
					alarm[1] = 5
				}
				
				if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0 and ataque_ar == true{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada3)
					audio_stop_sound(snd_porongaApagando)
					audio_play_sound(snd_porongaApagando,5,0,,,0.9)
					audio_play_sound(snd_espada3,3,0,,,random_range(0.9,1.2))
					alarm[1] = 5
					ataque_ar = false
				}
			break;
			
			case "Facão":
				if !instance_exists(Object33){
					obj_jogador.attackItem = spr_facao
					obj_jogador.damageMulti = 1.4

					if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0 and obj_jogador.pulando != true {
						obj_jogador.image_index = 0
						scr_Emote(spr_jogadorAtacando)
						audio_stop_sound(snd_espada2)
						audio_stop_sound(snd_porongaApagando)
						audio_play_sound(snd_porongaApagando,5,0,,,0.8)
						audio_play_sound(snd_espada2,3,0,,,random_range(0.8,1.1))
						obj_jogador.x += 15 * obj_jogador.image_xscale
						alarm[1] = 10
					}
					
					if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0 and ataque_ar == true{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada2)
					audio_stop_sound(snd_porongaApagando)
					audio_play_sound(snd_porongaApagando,5,0,,,0.8)
					audio_play_sound(snd_espada2,3,0,,,random_range(0.8,1.1))
					alarm[1] = 5
					ataque_ar = false
				}
				}
			break;
			
			case "Feijão":
				if global.fome < global.fomeMax {
					scr_removerItem(13,1)
					//global.fome += 5
					audio_stop_sound(snd_comer)
					audio_play_sound(snd_comer,10,0)
					scr_Emote(spr_jogadorItem)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-20,depth+1,360,13,spr_particulaFeijao,5,0.05,0.1)
					alarm[2] = 55
				}
				else{
					if obj_jogador.sprite_index != spr_jogadorPulando{
						scr_Emote(spr_jogadorNao)
						criar_dialogo(["Você não está com fome agora."],0,{})
					}
				}
			break;
			
			case "Carne seca":
				if global.fome < global.fomeMax{
					scr_removerItem(14,1)
					global.fome += 8
					audio_stop_sound(snd_comer)
					audio_play_sound(snd_comer,10,0)
					scr_Emote(spr_jogadorItem)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-20,depth+1,360,13,spr_particulaCarne,5,0.05,0.1)
					alarm[2] = 55
				}
				else{
					scr_Emote(spr_jogadorNao)
					criar_dialogo(["Você não está com fome agora."],0,{})
				}
			break;
			
			case "Farinha":
				if global.fome < global.fomeMax{
					scr_removerItem(15,1)
					global.fome += 3
					audio_stop_sound(snd_comer)
					audio_play_sound(snd_comer,10,0)
					scr_Emote(spr_jogadorItem)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-20,depth+1,360,13,spr_particulaFarinha,5,0.05,0.1)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-20,depth+1,360,13,spr_particulaNuvem,3,0.025,0.05)
					alarm[2] = 55
				}
				else{
					scr_Emote(spr_jogadorNao)
					criar_dialogo(["Você não está com fome agora."],0,{})
				}
			break;
			
			case "Mel":
					scr_removerItem(16,1)
					global.energia = global.energiaMax
					audio_stop_sound(snd_comer)
					audio_play_sound(snd_comer,10,0)
					scr_Emote(spr_jogadorItem)
					scr_explosaoParticula(obj_jogador.x,obj_jogador.y-20,depth+1,360,13,spr_particulaMel,5,0.05,0.1)
					alarm[2] = 55
			break;
		}
	}
}
#endregion