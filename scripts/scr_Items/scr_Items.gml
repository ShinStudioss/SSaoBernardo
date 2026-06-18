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