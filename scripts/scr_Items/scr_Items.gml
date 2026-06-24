function scr_getItem(_id){
    switch (_id){
        case 0:
            return {
                nome: "",
                sprite: spr_vazio,
                frame: 0,
                descricao: ""
            };
			break;

        case 1:
            return {
                nome: "Balde vazio",
                sprite: spr_item,
                frame: 0,
                descricao: "Balde utilizado para coletar látex das árvores."
            };
			break;

        case 2:
            return {
                nome: "Balde de látex",
                sprite: spr_item,
                frame: 1,
                descricao: "Balde cheio com látex de seringueira."
            };
			break;
			
		case 3:
            return {
                nome: "Faca de sangria",
                sprite: spr_item,
                frame: 2,
                descricao: "Ferramenta utilizada para cortar a casa das seringueiras."
            };
			break;
			
		case 4:
            return {
                nome: "Poronga",
                sprite: spr_item,
                frame: 3,
                descricao: "Pode ser colocada na cabeça para iluminar o caminho, mas está vazia."
            };
			break;
			
		case 5:
            return {
                nome: "Poronga acessa",
                sprite: spr_item,
                frame: 4,
                descricao: "Coloque na cabeça para iluminar. Se esgota com o tempo."
            };
			break;
			
		case 6:
            return {
                nome: "Poronga acessa",
                sprite: spr_item,
                frame: 5,
                descricao: "Use para abastecer a poronga. Consumido ápos o uso."
            };
			break
			
		case 7:
            return {
                nome: "Bola de Borracha",
                sprite: spr_item,
                frame: 6,
                descricao: "Usada para troca no barracão."
            };
			break
			
		case 8:
            return {
                nome: "Tarçado",
                sprite: spr_item,
                frame: 7,
                descricao: "Use para atacar os outros. Causa dano medio."
            };
			break
			
		case 9:
            return {
                nome: "Facão",
                sprite: spr_item,
                frame: 8,
                descricao: "Use para atacar os outros. Causa dano medio."
            };
			break
			
		case 10:
            return {
                nome: "Machadinha",
                sprite: spr_item,
                frame: 9,
                descricao: "Use para atacar os outros. Causa dano medio."
            };
			break
			
		case 11:
            return {
                nome: "Galho",
                sprite: spr_item,
                frame: 10,
                descricao: "Use para bater nos outros. Causa dano baixo e pode quebrar."
            };
			break
			
		case 12:
            return {
                nome: "Terço",
                sprite: spr_item,
                frame: 11,
                descricao: "Ao ser usado, realiza um milgre para auxiliar em seu objetivo. Consumivel."
            };
			break
			
		case 13:
            return {
                nome: "Feijoada",
                sprite: spr_item,
                frame: 12,
                descricao: "Consuma para reduzir a fome. Consumivel."
            };
			break
			
		case 14:
            return {
                nome: "Carne seca",
                sprite: spr_item,
                frame: 13,
                descricao: "Consuma para reduzir a fome. Consumivel."
            };
			break
			
		case 15:
            return {
                nome: "Farinha",
                sprite: spr_item,
                frame: 14,
                descricao: "Consuma para reduzir a fome. Consumivel."
            };
			break
			
		case 16:
            return {
                nome: "Mel",
                sprite: spr_item,
                frame: 15,
                descricao: "Consuma para reduzir a fome. Consumivel."
            };
			break
			
		case 17:
            return {
                nome: "Espingarda",
                sprite: spr_item,
                frame: 16,
                descricao: "Usado para atirar a curta distancia."
            };
			break
			
		case 18:
            return {
                nome: "Rifle",
                sprite: spr_item,
                frame: 17,
                descricao: "Usado para atirar a longas distancias."
            };
			break
    }

    return undefined;
}

function scr_buscarItem(_idItem){
	with (obj_inventario){
	    if (arrayPos < array_length(global.inventario)){
	        if (global. inventario[arrayPos][0] == _idItem){
	            return id;
	        }
	    }
    }
    return noone;
}

function scr_addItem(_idItem, quantidade)
{
    // Procura item igual para stackar
    for (var i = 0; i < array_length(global.inventario); i++)
    {
        if (global.inventario[i][0] == _idItem)
        {
            global.inventario[i][1] += quantidade;

            with (obj_inventario)
            {
                if (arrayPos == i)
                {
                    animPlay = false;
                }
            }

            return true;
        }
    }

    // Procura o primeiro slot vazio
    for (var i = 0; i < array_length(global.inventario); i++)
    {
        if (global.inventario[i][0] == 0)
        {
            global.inventario[i] = [_idItem, quantidade];

            with (obj_inventario)
            {
                if (arrayPos == i)
                {
                    animPlay = false;
                }
            }

            return true;
        }
    }

    return false;
}

function scr_removerItem(_idItem, _quantidade)
{
    var slot = scr_buscarItem(_idItem);

    if (slot == noone)
        return false;

    var pos = slot.arrayPos;
	slot.animPlay = false

    global.inventario[pos][1] -= _quantidade;

    if (global.inventario[pos][1] <= 0)
    {
        global.inventario[pos] = [0, 0];
    }

    return true;
}