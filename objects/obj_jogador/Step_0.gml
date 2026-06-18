keybinds = scr_getBinds()

#region Movimentação e colisão (clique para abrir)

// Movimentação básica =================================================================================
// Movimento para os lados, pegando o valor da direção do personagem e multiplicando pela velocidade
// Exemplo: Jogador pressiona DIREITA, que retorna 1 e é subtraído por ESQUERDA, que não está pressionado,
// retornando 0, a subtração resulta em 1 e é multiplicado pela velocidade

if global.pause = false{
inputX = keyboard_check(keybinds.right) - keyboard_check(keybinds.left)
}


if inputX != 0{
	image_xscale = inputX
	global.currentSpeed = lerp(global.currentSpeed,global.maxSpeed,0.8)
	var moveSpeed = inputX * global.currentSpeed
}
else{
	global.currentSpeed = lerp(global.currentSpeed,0,0.2)
	moveSpeed = global.currentSpeed * image_xscale
}

// Colisão horizontal + vertical =========================================================================
// Verifica se há colisões e trava a velocidade nesses casos. A colisão vertical é um pouco mais 
// elaborada que a condição horizontal devido a gravidade, mas nada demais

 if place_meeting(x + moveSpeed, y, obj_colisor){
        while (!place_meeting(x + sign(moveSpeed), y, obj_colisor)){
            x += sign(moveSpeed)
        }
		moveSpeed = 0
    }

// Movimento definitivo
x += moveSpeed * speedMulti

#endregion
	
#region Pulo, gravidade e colisão vertical (clique para abrir)

// Pulo =================================================================================
// Basicamente aqui é feita a definição da velocidade vertical quando aperta o botão de pulo.
// Tem umas frescurinha tipo o coyote time e a multiplicação da velocidade de queda, junto com
// aquela mecanica que o pulo é mais alto conforme você segura o botão

if keyboard_check_pressed(keybinds.jump) and coyoteTime > 0 and global.pause = false{
	jumpSpeed = alturaMaxPulo
    coyoteTime = 0    
}

if place_meeting(x, y+1, obj_colisor){
    coyoteTime = 10
}
else{
    jumpSpeed += gravidade
	coyoteTime--
}
	
if keyboard_check_released(keybinds.jump) and jumpSpeed < 0{
	jumpSpeed *= 0.4
	coyoteTime = 0
}

// Sprite machine
if jumpSpeed = 0{
	if inputX != 0{
		sprite_index = spr_jogadorAndando
	}
	else{
		sprite_index = spr_jogadorParado
	}
}
else{
	sprite_index = spr_jogadorPulando
	if sign(jumpSpeed) = 1{
		image_index = clamp(image_index,3,4)
	}
	else{
		image_index = clamp(image_index,0,2)
	}
}


// Colisão vertical (ajustada com partículas)
if place_meeting(x, y + jumpSpeed, obj_colisor){
    while (!place_meeting(x, y + sign(jumpSpeed), obj_colisor)){
        y += sign(jumpSpeed)
    }

    // Partículas ao aterrissar, se estava caindo (jumpSpeed positivo)
    if jumpSpeed > 0{
        scr_explosaoParticula(x,y+sprite_height/2,depth+1,180,jumpSpeed,spr_particulaGrama,10,0.03,0.1)
    }

    jumpSpeed = 0
}


// Movimento definitivo
y += jumpSpeed
	
// Limitando a velocidade de queda, usando o número fixo porque aqui é meio que o único
// lugar que a gente manuseia a velocidade da queda :p
if jumpSpeed > 30{
	jumpSpeed = 30
}

#endregion

#region Efeitos visuais (clique para abrir)

// Partículas ===================================================================================
// Aqui é feita a geração de partículas. O valor do sprite da partícula varia de room pra room

// Particulas ao caminhar
particleTimer--
if particleTimer <= 0{
	if jumpSpeed = 0 and inputX != 0{
		scr_criarParticula(x,y+sprite_height/2-15,depth+1,spr_particulaGrama,random_range(180,90)*inputX,2*inputX,0.06)
	}
	
	particleTimer = 0.5
}


#endregion

#region Correr
var fomePerc = clamp(global.fome / global.fomeMax, 0, 1)

fomePerc = power(fomePerc, 1.5)

var walkMin = 0.4
var walkMax = 1.0

var runMin = 0.6
var runMax = 1.4

var walkSpeed = lerp(walkMin, walkMax, fomePerc)
var runSpeed  = lerp(runMin, runMax, fomePerc)

if keyboard_check(keybinds.run) and global.energia > 0{
	speedMulti = runSpeed
	image_speed = lerp(1, 1.67, fomePerc)
	global.energia -= 0.15 * (1 - fomePerc * 0.5) 
}
else{
	speedMulti = walkSpeed
	image_speed = 1
	
	if global.fome > global.fomeMax * 0.4 and global.energia < global.energiaMax and !keyboard_check(keybinds.run){
		global.energia += (global.fome/global.fomeMax) / 30
	}
}
#endregion

// Regeneração de vida
if (lifeRegenTimer <= 0){
    if (global.fome > global.fomeMax * 0.5){
        if (global.saude < global.saudeMax){
            global.saude += lifeRegen
        }
    }
    lifeRegenTimer = lerp(600, 120, global.fome / global.fomeMax)
}

if global.fome <= 0{
	global.saude -= 0.01
}
lifeRegenTimer--

show_debug_message(lifeRegenTimer)
// ========================================================================

if keyboard_check(ord("N")){
	global.fome -= 1
}

if keyboard_check(ord("M")){
	global.fome += 1
}

if keyboard_check_pressed(ord("B")){
	global.saude -= 2
}