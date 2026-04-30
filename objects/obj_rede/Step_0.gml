keybinds = scr_getBinds()

var distancia = distance_to_object(obj_jogador)
var cima = keyboard_check_pressed(keybinds.up);

if (distancia < 40 && cima) {
	criar_dialogo(["Você se sente cansado.","Deseja sonhar?", ""], true, [{text:"Sim, eu quero sonhar.", action: "dormir"},{text:"Não.", action:"cancel"}])
}
