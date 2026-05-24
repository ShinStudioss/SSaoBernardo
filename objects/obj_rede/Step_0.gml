keybinds = scr_getBinds()

var distancia = distance_to_object(obj_jogador)
var cima = keyboard_check_pressed(keybinds.interact);

if (distancia < 40 && cima) {
	if global.daytime == "dia" {
		criar_dialogo(["Você se sente cansado.","Deseja dormir?", ""], true, [{text:"Sim. Dormir agora.", action: "dormir"},{text:"Não. Ainda tenho trabalho a fazer.", action:"cancel"}])
	}
	else{
		criar_dialogo(["Deseja dormir?", ""], true, [{text:"Sim. Dormir agora.", action: "dormir"},{text:"Não.", action:"cancel"}])
	}
}
