keybinds = scr_getBinds()

depth = obj_jogador.depth + 1

var distancia = distance_to_object(obj_jogador)
var cima = keyboard_check_pressed(keybinds.interact);

var dialogo;

switch state{
    case "sembalde":
        image_alpha = 0
        dialogo = function(){ criar_dialogo(["É uma seringueira. Para extrair o látex, é necesário um balde.",""], true, [{text: "Colocar balde para coleta.", action: "colocarbalde"}, {text: "Cancelar", action: "cancel"}]) }
    break;

	case "corte":
		dialogo = function(){}
	break

    case "vazio":
        image_alpha = 1
        image_index = 1
        dialogo = function(){ criar_dialogo(["É uma seringueira, a árvore de onde o látex é extraído. Um pequeno corte é feito pra que possa escorrer de dentro pra fora. Deseja iniciar o processo?",""], true, [{text: "Sim, cortar um pedaço da casca.", action: "cortarcasca"}, {text: "Cancelar", action: "cancel"}]) }
    break;
	
	case "cheio":
		image_index = 0
		dialogo = function(){ scr_addItem(2,1) quantidade = 0 state = "sembalde"}
	break
}

if (distancia < 40 && cima) and !instance_exists(obj_dialogBox){
    dialogo()
}

image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
image_angle = lerp(image_angle,1,0.3)