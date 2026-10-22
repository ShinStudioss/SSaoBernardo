// Define a aparência e o diálogo conforme o tipo do NPC.
vel_queda = 0
dicaDia = scr_dica()
switch (npc_tipo)
{
    case "luiz": 
        sprite_index = spr_npcLuizFelipe;
        dialogoNPC = [
            "Luiz: Bom dia, Raimundo!",
            "Vai me pagar aquela breja quando? hehe",
            dicaDia,
        ];
    break;

    
	case "estevao":

	    climaAmanha = scr_preverClima()
		
	    sprite_index = spr_npcEstevao;
	    switch (climaAmanha){
	        case "limpo":
	            dialogoNPC = [
	                "Estevão: Amanhã o céu deve abrir.",
	                "Parece que vamo ter um dia de céu limpo.",
	                "Aproveitar pra por minhas cueca pra secar HaHa."
	            ];
	        break;

	        case "nublado":
	            dialogoNPC = [
	                "Estevão: Amanhã o céu deve ficar nublado.",
	                "Pelo menos não parece que vai cair água.",
	                "Mas, nesses mato, nunca dá pra confiar demais."
	            ];
	        break;

	        case "chovendo":
	            dialogoNPC = [
	                "Estevão: Amanhã vai cair um toró.",
	                "Melhor se apressar no serviço, filho.",
	                "Quando chove não tem quem faça a casca sangrar."
	            ];
	        break;
	    }

	break;


    case "generico":
        sprite_index = spr_npcGenerico;
        dialogoNPC = [
            "Bom dia!",
            "Espero que sua jornada corra bem."
        ];
    break;

    default:
        sprite_index = spr_npcGenerico;
        dialogoNPC = ["Olá!"];
    break;
}

// Configuração da animação
escalaRespiracao = 1;
image_yscale = 1;
image_xscale = 1;
novo_dialogo = true