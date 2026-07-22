// Definição de variáveis ===================================================================================
// Variáveis que iniciam com a nomeclatura "stat" são atributos do jogador que serão acessados por diferentes
// partes do jogo, e por isso são globais
inputX = 0

global.maxSpeed = 7
global.currentSpeed = 0

alturaMaxPulo = -13
attackMove = 0
porongaScale = 1
gravidade = 0.6
coyoteTime = 0
prevCoyoteTime = coyoteTime
jumpSpeed = 0
particleTimer = 0
speedMulti = 1
damageMulti = 1
lifeRegenTimer = 120
lifeRegen = 3
attackItem = spr_vazio
effectColor = [255,255,255]

global.saudeMax = 30
global.saude = 30

global.energiaMax = 20
global.energia = 20

global.fomeMax = 20
global.fome = 16

global.forca = 5

instance_create_depth(56,72,depth,obj_hud)

idleSprite = spr_jogadorParado

itemX = 0
itemY = 0

_verificador = noone
pulando = false