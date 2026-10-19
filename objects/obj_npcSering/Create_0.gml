// Define a aparência e o diálogo conforme o tipo do NPC.
vel_queda = 0
switch (npc_tipo)
{
    case "luiz":
        sprite_index = spr_npc1;
        dialogoNPC = [
            "Luiz: Bom dia, seringueiro!",
            "O trabalho na mata nunca termina."
        ];
    break;

    case "estevao":
        sprite_index = spr_npc2;
        dialogoNPC = [
            "Estevão: Cuidado por onde anda.",
            "A mata pode esconder muitos perigos."
        ];
    break;

    case "generico":
        sprite_index = spr_npc3;
        dialogoNPC = [
            "Morador: Bom dia!",
            "Espero que sua jornada corra bem."
        ];
    break;

    default:
        sprite_index = spr_npc3;
        dialogoNPC = ["Morador: Olá!"];
    break;
}

// Configuração da animação
escalaRespiracao = 1;
image_yscale = 1;
image_xscale = 1;