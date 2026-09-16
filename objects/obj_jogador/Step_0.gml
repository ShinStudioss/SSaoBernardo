keybinds = scr_getBinds()
mask_index = spr_jogadorParado

#region Movimentação e colisão (clique para abrir)

// Movimentação básica =================================================================================
// Movimento para os lados, pegando o valor da direção do personagem e multiplicando pela velocidade
// Exemplo: Jogador pressiona DIREITA, que retorna 1 e é subtraído por ESQUERDA, que não está pressionado,
// retornando 0, a subtração resulta em 1 e é multiplicado pela velocidade

if global.pause = false {
	if !(sprite_index = spr_jogadorTiro or sprite_index = spr_jogadorItem){
		inputX = keyboard_check(keybinds.right) - keyboard_check(keybinds.left)
	}
	else{
		inputX = 0
		global.currentSpeed = 0
	}
}

if inputX != 0{
	xScaleReal = inputX
	global.currentSpeed = lerp(global.currentSpeed,global.maxSpeed,0.8)
	var moveSpeed = inputX * global.currentSpeed
}
else{
	global.currentSpeed = lerp(global.currentSpeed,0,0.2)
	moveSpeed = global.currentSpeed * xScaleReal
}

// Colisão horizontal + vertical =========================================================================
// Verifica se há colisões e trava a velocidade nesses casos. A colisão vertical é um pouco mais 
// elaborada que a condição horizontal devido a gravidade, mas nada demais

// Checagem de colisão horizontal
if (moveSpeed != 0)
{
    if (place_meeting(x + moveSpeed * speedMulti, y, obj_colisor))
    {
        while (!place_meeting(x + sign(moveSpeed), y, obj_colisor))
        {
            x += sign(moveSpeed);
        }

        while (place_meeting(x, y, obj_colisor))
        {
            x -= sign(moveSpeed);
        }

        moveSpeed = 0;
    }
}

// Movimento final
if (trepando){
	if sprite_index != spr_jogadorAtacando and sprite_index != spr_jogadorTiro{
	x += moveSpeed * (speedMulti/3);
	}
}
else{
	if sprite_index != spr_jogadorAtacando and sprite_index != spr_jogadorTiro{
		x += moveSpeed * speedMulti;
	}
}

#endregion

#region Coice de armas

// Aplica o recuo
if (abs(recoil) > 0.1){
    var dist = abs(round(recoil));
    var dir = sign(recoil);

    // Move pixel a pixel para respeitar as colisões
    for (var i = 0; i < dist; i++){
        if (!place_meeting(x + dir, y, obj_colisor)){
            x += dir;
        }
        else{
			
            recoil = 0;
            break;
        }
    }

    // Reduz a força do recuo gradualmente
    recoil *= 0.80;

    // Evita valores muito pequenos
    if (abs(recoil) < 0.1)
    {
        recoil = 0;
    }
}

#endregion
	
#region Escalada

// Entrar na escalada
if (place_meeting(x, y, obj_trepante)){
	if (podeTrepar && keyboard_check_pressed(keybinds.up))
	or (podeTrepar && keyboard_check_pressed(keybinds.down)){
	    trepando = true;
	    jumpSpeed = 0;
	}

	// Sair da escalada
	if (trepando){
	    // Se saiu do cipó
		pulando = false
		coyoteTime = 10;
	    if (!podeTrepar){
	        trepando = false;
	    }
		
		if sprite_index == spr_jogadorAtacando
		or sprite_index == spr_jogadorTiro{
			obj_cursor.ataque_ar = false
			trepando = false
			pulando = true
			coyoteTime = 0
		}

	    // Pular para soltar
	    if (keyboard_check_pressed(keybinds.jump)){
	        trepando = false;
	        jumpSpeed = alturaMaxPulo;
	    }

	    // Movimento vertical
	    jumpSpeed = 0;

	    if (keyboard_check(keybinds.up)){
	        jumpSpeed = -velTrepar;
			image_speed = 1
		}
		else{
		    if (keyboard_check(keybinds.down)){
		        jumpSpeed = velTrepar;
				image_speed = -1
			}
			else{
				image_speed = 0
			}
		}
		
		if (!place_meeting(x, y + jumpSpeed*2, obj_colisor)){
		    y += jumpSpeed*2;
		}
		else{
		    jumpSpeed = 0;
		}

	    // Sprite
		if trepando{
			sprite_index = spr_jogadorTrepando;
		}
		
	}
}
else{
	if jumpSpeed > 0
	or jumpSpeed > 0 and (sprite_index == spr_jogadorTiro or sprite_index == spr_jogadorAtacando){
		pulando = true
	}
	podeTrepar = false
	trepando = false
}
#endregion
	
#region Pulo, gravidade e colisão vertical (clique para abrir)

// Pulo =================================================================================
// Basicamente aqui é feita a definição da velocidade vertical quando aperta o botão de pulo.
// Tem umas frescurinha tipo o coyote time e a multiplicação da velocidade de queda, junto com
// aquela mecanica que o pulo é mais alto conforme você segura o botão
if !trepando{
	if keyboard_check_pressed(keybinds.jump) and coyoteTime > 0 and global.pause = false {
		if !(sprite_index = spr_jogadorTiro or sprite_index = spr_jogadorItem or sprite_index = spr_jogadorAtacando){
			pulando = true
			xScaleReal = sign(xScaleReal) * 0.5
			yScaleReal = 1.6
			// Altura do pulo varia conforme a fome
			jumpSpeed = alturaMaxPulo

			if (global.fome <= global.fomeMax)
			{
			    jumpSpeed = alturaMaxPulo * 1
			}

			if (global.fome <= global.fomeMax / 2)
			{
			    jumpSpeed = alturaMaxPulo * 0.85
			}

			if (global.fome <= global.fomeMax / 4)
			{
			    jumpSpeed = alturaMaxPulo * 0.70
			}
		    coyoteTime = 0
		}
	}
	

	if place_meeting(x, y+1, obj_colisor){
	    coyoteTime = 10
	}
	else{
		if jumpSpeed <= maxjumpspeed{
		    jumpSpeed += gravidade
			coyoteTime--
		}
	}
	
	if keyboard_check_released(keybinds.jump) and jumpSpeed < 0{
		idleSprite = spr_jogadorParado
		jumpSpeed *= 0.4
		coyoteTime = 0
	}

	// Sprite machine
	if sprite_index != spr_jogadorAtacando and sprite_index != spr_jogadorTiro{
		if jumpSpeed = 0{
			pulando = false
			if inputX != 0{
				idleSprite = spr_jogadorParado
				sprite_index = spr_jogadorAndando
			}
			else{
				sprite_index = idleSprite
			}

		}
		else{
			sprite_index = spr_jogadorPulando
			if jumpSpeed < -2{
				xScaleReal = lerp(xScaleReal, sign(xScaleReal) * 0.9, 0.2)
				yScaleReal = lerp(yScaleReal, 1.15, 0.2)
			}
			if sign(jumpSpeed) = 1{
				image_index = clamp(image_index,3,4)
			}
			else{
				image_index = clamp(image_index,0,2)
			}
		}
	}else{
	}

	// Colisão vertical (ajustada com partículas)
	if place_meeting(x, y + jumpSpeed, obj_colisor){
	    while (!place_meeting(x, y + sign(jumpSpeed), obj_colisor)){
	        y += sign(jumpSpeed)
	    }

	    // Partículas ao aterrissar, se estava caindo (jumpSpeed positivo)
	    if jumpSpeed > 0{
			xScaleReal = sign(xScaleReal) * 1.7
			yScaleReal = 0.8
	        var intensidade = clamp(global.fome / global.fomeMax, 0, 1);

			var qtdParticulas = round(lerp(3, jumpSpeed, intensidade));

			scr_explosaoParticula(x,y + sprite_height / 2,depth + 1,180,max(qtdParticulas,3),spr_particulaGrama,lerp(5,10,intensidade),0.03,0.1);
		}

	    jumpSpeed = 0
	}

	// Pausa no ar durante o ataque
	if sprite_index == spr_jogadorAtacando or sprite_index == spr_jogadorTiro
	{
	    jumpSpeed = 0;
	}

	// Movimento definitivo
	y += jumpSpeed
	
	// Limitando a velocidade de queda
	if jumpSpeed > 30{
		jumpSpeed = 30
	}
}

#endregion

#region Efeitos visuais (clique para abrir)

// Partículas ===================================================================================
// Aqui é feita a geração de partículas. O valor do sprite da partícula varia de room pra room

// Particulas ao caminhar
// Calcula a intensidade das partículas com base na velocidade atual
var intensidade = clamp(global.currentSpeed / global.maxSpeed, 0, 1);

// Quanto maior a velocidade, menor o intervalo entre partículas
particleTimer--;

if (particleTimer <= 0)
{
    if (jumpSpeed == 0 && inputX != 0)
    {
        scr_criarParticula(
            x,
            y + sprite_height / 2 - 15,
            depth + 1,
            spr_particulaGrama,
            random_range(90,180) * inputX,
            2 * inputX,
            0.06
        );
    }

    // Quanto maior o speedMulti, menor o intervalo entre partículas
    particleTimer = lerp(8, 2, clamp(speedMulti / 1.6, 0, 1));
}


#endregion
// Correndo =====================================================================
// Calculo de speedmulti, fome, shift, etc...
#region
var fomePerc = clamp(global.fome / global.fomeMax, 0, 1)

fomePerc = power(fomePerc, 1.5)

var walkMin = 0.3
var walkMax = 1.0

var runMin = 0.4
var runMax = 1.6

var walkSpeed = lerp(walkMin, walkMax, fomePerc)
var runSpeed  = lerp(runMin, runMax, fomePerc)

if !trepando{
	if keyboard_check(keybinds.run) and global.energia > 0 and inputX != 0 and (sprite_index != spr_jogadorAtacando){
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
if sprite_index = spr_jogadorRezando{
	global.pause = true
	if image_index = image_number-2{
		image_speed = 0
		if tercoDialogo = 0{
			tercoDialogo = criar_dialogo(["Ave maria, cheia de graça, o senhor é convosco. Bendita sois vós entre as mulheres, bendito é o fruto do vosso ventre; Jesus.","Santa Maria mãe de Deus, rogai por nós pecadores, agora e na hora de nossa morte... Amém."],0,{},1.5,snd_raimundoVoz,0.3,5)
		}
	}
}

xScaleReal = lerp(xScaleReal, sign(xScaleReal), 0.1)
yScaleReal = lerp(yScaleReal, 1, 0.1)

// Ficar com fome
if 
inputX != 0 or
jumpSpeed < alturaMaxPulo/2 or
sprite_index = spr_jogadorAtacando
{
	global.tickFome -= 1
}

if global.tickFome <= 0{
	obj_hud.fomeShake = 5
	global.fome -= 0.5
	global.tickFome = 600
}

// Batidas do coração
if (global.saude <= global.saudeMax * 0.5)
{
    var _t = 1 - ((global.saude - global.saudeMax * 0.01) / (global.saudeMax * 0.49));
    _t = clamp(_t, 0, 1);

    var _volume = lerp(0.5, 1.5, _t);
    var _pitch  = lerp(1.0, 2.0, _t);

    audio_group_set_gain(audiogroup_default, lerp(global.sfxVolume, global.sfxVolume * 0.1, _t), 0);

    if (!audio_is_playing(snd_heartbeat))
    {
		obj_hud.coracaoSize = _pitch;
        audio_play_sound(snd_heartbeat, 0, false, _volume, 0, _pitch);
    }
}
else
{
    audio_stop_sound(snd_heartbeat);
    audio_group_set_gain(audiogroup_default, global.sfxVolume, 0);
}

if global.saude <= 0{
	instance_create_depth(x,y,depth,obj_jogadorMorrendo,{moveSpeed: moveSpeed, speedMulti: speedMulti})
	instance_destroy()
}
	
	
// Ta tudo errado	
var item_id = global.inventario[global.itemSelecionado][0]
if keyboard_check_pressed(ord("T")) and item_id != 0 {
	array_push(global.itens_mundo, {
        _x: x,
        _y: y,
        _id: item_id,
        _qtd: 1,
        _room: room
    });
	scr_DropItem(item_id,x,y,depth,1)
	scr_removerItem(item_id,1)	
}
