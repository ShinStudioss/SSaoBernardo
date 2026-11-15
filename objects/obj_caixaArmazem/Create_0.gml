// As funções da caixa ficam no script scr_caixaArmazem.
// Estados: 0 = fechada | 1 = aberta
depth = obj_jogador.depth+1
caixaEstado = 0
travaInput = 0 // frames em que ignora o mouse logo após abrir (não aproveita o clique de abertura)
depthOriginal = depth

// Inventário universal da caixa: lista de espaços [id, quantidade] ([0,0] = vazio).
// Começa com 2 espaços e cresce até 6. É global, então toda caixa do jogo mostra o mesmo conteúdo.
// (Recomendado: criar também no Create do obj_controladorDojogo, junto do global.inventario:
//  global.Caixainventario = [[0,0],[0,0]]  -- cada espaço precisa ter 2 valores: [id, quantidade] )
caixaMax = 6
scr_caixaNormalizar() // cria a lista se não existir e corrige o formato dos espaços

// Lenhas (item 21) necessárias para liberar o 3º, 4º, 5º e 6º espaço.
// PLACEHOLDERS: ajuste ao seu balanceamento.
idLenha = 21
custoExpansao = [5, 10, 15, 20]

// Foco (seleção por teclado/mouse) e arrasto
foco = {caixa: false, i: 0} // caixa: true = linha da caixa | false = linha do jogador
arrastando = undefined // {deCaixa, i, id, qtd} enquanto o jogador arrasta um item
mxAnt = -1
myAnt = -1

// Layout (coordenadas da GUI)
tamSlot = 144
espSlot = 16
descricaoPadrao = "Passe o cursor pelos itens para mais informações."
painelX = 0
painelY = 0
painelW = 0
painelH = 0
caixaY = 0
jogadorY = 0
textoY = 0