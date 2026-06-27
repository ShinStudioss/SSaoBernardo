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
		        descricao: "Balde de coleta utilizado para armazenar o látex extraído das seringueiras."
		    };
		    break;

		case 2:
		    return {
		        nome: "Balde de látex",
		        sprite: spr_item,
		        frame: 1,
		        descricao: "Balde cheio de látex fresco, pronto para ser processado."
		    };
		    break;

		case 3:
		    return {
		        nome: "Faca de sangria",
		        sprite: spr_item,
		        frame: 2,
		        descricao: "Ferramenta afiada usada para realizar a sangria das seringueiras e extrair seu látex."
		    };
		    break;

		case 4:
		    return {
		        nome: "Poronga",
		        sprite: spr_item,
		        frame: 3,
		        descricao: "Lamparina tradicional dos seringueiros. Precisa de combustível para funcionar."
		    };
		    break;

		case 5:
		    return {
		        nome: "Poronga acesa",
		        sprite: spr_item,
		        frame: 4,
		        descricao: "Poronga abastecida e acesa. Ilumina a mata durante a noite, mas o combustível se esgota com o tempo."
		    };
		    break;

		case 6:
		    return {
		        nome: "Querosene",
		        sprite: spr_item,
		        frame: 5,
		        descricao: "Recipiente com combustível para abastecer uma poronga. Consumido após o uso."
		    };
		    break;

		case 7:
		    return {
		        nome: "Bola de Borracha",
		        sprite: spr_item,
		        frame: 6,
		        descricao: "Bola de borracha produzida a partir do látex. Possui valor de troca no barracão."
		    };
		    break;

		case 8:
		    return {
		        nome: "Terçado",
		        sprite: spr_item,
		        frame: 7,
		        descricao: "Terçado robusto usado tanto para abrir caminho na mata quanto para combate. Causa dano médio."
		    };
		    break;

		case 9:
		    return {
		        nome: "Facão",
		        sprite: spr_item,
		        frame: 8,
		        descricao: "Facão afiado e resistente. Uma ferramenta versátil que também serve como arma. Causa dano médio."
		    };
		    break;

		case 10:
		    return {
		        nome: "Machadinha",
		        sprite: spr_item,
		        frame: 9,
		        descricao: "Machadinha leve utilizada para cortar madeira. Pode ser usada em combate. Causa dano médio."
		    };
		    break;

		case 11:
		    return {
		        nome: "Galho",
		        sprite: spr_item,
		        frame: 10,
		        descricao: "Galho improvisado encontrado na mata. Causa pouco dano e pode quebrar durante o uso."
		    };
		    break;

		case 12:
		    return {
		        nome: "Terço",
		        sprite: spr_item,
		        frame: 11,
		        descricao: "Objeto de devoção. Ao ser utilizado, pode conceder uma intervenção divina inesperada. Consumível."
		    };
		    break;

		case 13:
		    return {
		        nome: "Feijoada",
		        sprite: spr_item,
		        frame: 12,
		        descricao: "Prato tradicional e bastante nutritivo. Reduz significativamente a fome. Consumível."
		    };
		    break;

		case 14:
		    return {
		        nome: "Carne seca",
		        sprite: spr_item,
		        frame: 13,
		        descricao: "Carne salgada e seca, ideal para longas jornadas na floresta. Reduz a fome. Consumível."
		    };
		    break;

		case 15:
		    return {
		        nome: "Farinha",
		        sprite: spr_item,
		        frame: 14,
		        descricao: "Farinha de mandioca, alimento básico dos seringueiros. Reduz a fome. Consumível."
		    };
		    break;

		case 16:
		    return {
		        nome: "Mel",
		        sprite: spr_item,
		        frame: 15,
		        descricao: "Mel silvestre coletado na floresta. Fonte rápida de energia e alimento. Consumível."
		    };
		    break;

		case 17:
		    return {
		        nome: "Espingarda",
		        sprite: spr_item,
		        frame: 16,
		        descricao: "Espingarda de curto alcance, eficaz para caça e defesa pessoal."
		    };
		    break;

		case 18:
		    return {
		        nome: "Carabina",
		        sprite: spr_item,
		        frame: 17,
		        descricao: "Carabina precisa e potente, capaz de atingir alvos a grandes distâncias."
		    };
		    break;

		    return undefined;
	}
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
