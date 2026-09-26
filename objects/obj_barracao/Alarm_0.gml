obj_controladorDoJogo.larguraCamAlvo = 1152 * 0.8
obj_controladorDoJogo.alturaCamAlvo = 648 * 0.8
var choice = choose(
	"Será que dessa vez paga o almoço?",
	"Vai trabalhar no escuro de novo? Tem que comprar uma poronga, hein!",
	"Essa borracha aí tá meio pouca, não acha?",
	"Se continuar nesse ritmo, vai ficar rico... eu, no caso.",
	"Não vai gastar tudo em comida, hein? Tem que pensar no amanhã!",
	"Tá precisando de ferramenta? Tenho umas aqui... mas não faço caridade.",
	"Se chover, não venha reclamar que a borracha molhou.",
	"Capricha nesses corte aí, rapaz. Cada gota dessas vale dinheiro!",
)
introDialog = criar_dialogo(["Patrão Mané:\nBora, Raimundão. Hora de prestar as contas dessa borracha.",$"Patrão Mané:\n{choice}"],false,[],,)
