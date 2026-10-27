// Define a aparência e o diálogo conforme o tipo do NPC.
vel_queda = 0
dicaDia = scr_dica()
switch (npc_tipo)
{
    case "luiz":
        sprite_index = spr_npcLuizFelipe;

        var escolha = choose(
            "Dormiu direito, Raimundo? Tu tá com uma cara de quem passou a noite inteira ouvindo coisa.",
            "Ô, Raimundo... tu também sente que tem alguém olhando quando a gente tá sozinho?",
            "Rapaz, sonhei contigo essa noite. Tu tava no meio do mato, parado, sem responder ninguém.",
            "Essa mata tá esquisita ultimamente. Até os cachorro tão evitando passar por lá.",
            "Tu anda trabalhando demais, homem. Daqui a pouco vai começar a conversar com as árvore.",
            "Se eu fosse tu, não ficava dando bobeira depois que escurece. Tem coisa que é melhor não encontrar.",
            "Raimundo, tu acredita que eu ouvi alguém me chamando ontem? O problema é que não tinha ninguém lá.",
            "Eu ia te chamar pra tomar uma, mas deixa pra outro dia. Ando sem vontade de ficar na rua depois do anoitecer."
        );

        dialogoNPC = [
            "Luiz: Ô, Raimundo... bom te ver, homem. Esses dias tão passando devagar demais, num acha?",
            escolha,
            dicaDia,
        ];
    break;


    case "estevao":
        sprite_index = spr_npcEstevao;
        climaAmanha = scr_preverClima();

        switch (climaAmanha)
        {
            case "limpo":
                dialogoNPC = [
                    "Estevão: O sol apareceu cedo hoje. Fazia uns dias que eu não via essa claridade toda.",
                    "Amanhã o céu deve ficar limpo. Aproveita pra trabalhar enquanto ainda dá pra enxergar o caminho."
                ];
            break;

            case "nublado":
                dialogoNPC = [
                    "Estevão: O céu tá com uma cor estranha desde cedo. Parece que o dia nem terminou de amanhecer.",
                    "Amanhã deve ficar nublado. Fica de olho no tempo, porque essa mata muda depressa."
                ];
            break;

            case "chovendo":
                dialogoNPC = [
                    "Estevão: Passei a manhã escutando o vento bater nas telha. Não gostei do que ouvi lá fora.",
                    "Amanhã vai chover. Melhor adiantar o serviço hoje, porque na chuva fica difícil enxergar qualquer coisa no seringal."
                ];
            break;
        }
    break;


    case "generico":
        sprite_index = spr_npcGenerico;
        var escolha = choose(
            "Faz uns dias que eu não durmo direito. Toda noite parece que tem alguém andando no quintal.",
            "Tu viu alguém passando por aqui de madrugada? Escutei passos, mas não tive coragem de olhar.",
            "Meu pai dizia pra nunca responder quando alguém chamasse teu nome no meio do mato.",
            "Hoje eu tranquei a porta antes do sol se pôr. Não sei explicar, só achei melhor.",
            "Tem alguma coisa errada com esse lugar. O povo só não gosta de falar sobre isso.",
            "Eu ouvi uma conversa vindo da mata ontem. Quando cheguei perto, só tinha silêncio.",
            "Tu também tá sentindo esse cheiro? Parece que vem lá de dentro do seringal.",
            "O povo anda sumindo cedo das ruas. Acho que ninguém quer ser o último a voltar pra casa."
        );

        dialogoNPC = [
            "Morador: Ô, Raimundo. Bom dia... se é que ainda dá pra chamar isso de bom dia.",
            escolha
        ];
    break;


    default:
        sprite_index = spr_npcGenerico;
        dialogoNPC = [
            "Morador: Ah, Raimundo... pensei que tu não vinha mais.",
            "Enfim, deixa pra lá. Tenho umas coisa pra resolver antes de escurecer."
        ];
    break;
}
// Configuração da animação
escalaRespiracao = 1;
image_yscale = 1;
image_xscale = 1;
novo_dialogo = true

chave = "npc_" + room_get_name(room) + "_" + string(x) + "_" + string(y);
if variable_struct_exists(global.npcs, chave){
	var dados = global.npcs[$ chave]
	overlay = dados.overlay
	temChapeu = dados.temChapeu 
}
else{
	overlay = [irandom_range(0,2),irandom_range(0,2),irandom_range(0,1)]
	temChapeu = (irandom(100) <= 33)
}

