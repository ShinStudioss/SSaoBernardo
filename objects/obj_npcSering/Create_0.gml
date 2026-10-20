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
        sprite_index = spr_npcEstevao;
        dialogoNPC = [
            "Estevão: Cuidado por onde anda.",
            "A mata pode esconder muitos perigos."
        ];
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