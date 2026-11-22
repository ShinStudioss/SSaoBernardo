event_inherited()

// Atributos
vida = 2
dano = 2
velocidade = 1.2          // também define a velocidade do knockback
alcanceVisao = 300
image_blend = c_red

// Estado: "parado", "aviso", "dash"
estado = "parado"
tempoEspera = 60          // tempo parado antes de começar o aviso
tempoEsperaMax = 60

// Aviso: pisca em branco 3 vezes
// Cada valor é a espera ANTES do bipe. O último é a espera depois do 3º bipe, antes do dash.
intervalosAviso = [30, 18, 8, 8]
avisoIndex = 0
avisoTimer = 0
flashBranco = false
flashTimer = 0
duracaoFlash = 5

// Dash
dashVel = 12
dashDuracao = 40
dashTimer = 0
dashDir = 1

dir = 1