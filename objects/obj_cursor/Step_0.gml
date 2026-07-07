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

if mouse_check_button_pressed(mb_left){
	if _item.nome != ""{
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
					
				if obj_jogador.sprite_index != spr_jogadorAtacando{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada1)
					audio_play_sound(snd_espada1,3,0,,,random_range(0.9,1.2))
					obj_jogador.x += 5 * obj_jogador.image_xscale
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
				audio_play_sound(snd_porongaApagando,4,0)
			break;
			
			case "Querosene":
				audio_play_sound(snd_porongaAcendendo,4,0)
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
					
				if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0{
					obj_jogador.image_index = 0
					scr_Emote(spr_jogadorAtacando)
					audio_stop_sound(snd_espada3)
					audio_stop_sound(snd_porongaApagando)
					audio_play_sound(snd_porongaApagando,5,0,,,0.9)
					audio_play_sound(snd_espada3,3,0,,,random_range(0.9,1.2))
					obj_jogador.x += 10 * obj_jogador.image_xscale
					alarm[1] = 5
				}
			break;
			
			case "Facão":
				if !instance_exists(Object33){
					obj_jogador.attackItem = spr_facao
					obj_jogador.damageMulti = 1.4

					if obj_jogador.sprite_index != spr_jogadorAtacando and alarm[1] <= 0 {
						obj_jogador.image_index = 0
						scr_Emote(spr_jogadorAtacando)
						audio_stop_sound(snd_espada2)
						audio_stop_sound(snd_porongaApagando)
						audio_play_sound(snd_porongaApagando,5,0,,,0.8)
						audio_play_sound(snd_espada2,3,0,,,random_range(0.8,1.1))
						obj_jogador.x += 15 * obj_jogador.image_xscale
						alarm[1] = 10
					}
				}
			break;
			
		}
	}
}
#endregion