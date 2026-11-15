event_inherited() // atualiza keybinds, distancia e cima (obj_interagivel)

switch (caixaEstado){
	case 0: // Fechada: espera o clique do jogador
		if (cima and distancia < 70 and !global.pause and !instance_exists(obj_dialogBox)){
			scr_caixaAbrir()
		}
	break

	case 1: // Aberta
		global.pause = true
		// Igual ao obj_barracao: segura o jogador parado enquanto o jogo está pausado
		obj_jogador.speed = 0
		obj_jogador.sprite_index = spr_jogadorParado

		scr_caixaCalcularLayout()

		var _mx = device_mouse_x_to_gui(0)
		var _my = device_mouse_y_to_gui(0)
		var _moveu = (_mx != mxAnt or _my != myAnt)
		mxAnt = _mx
		myAnt = _my

		// Ignora input nos primeiros frames (o clique que abriu a caixa não conta)
		if (travaInput > 0){
			travaInput--
			break
		}

		// ---------------------------------------------
		// FECHAR: tecla de interação (E) ou botão "X"
		// ---------------------------------------------
		var _bf = scr_caixaRetanguloFechar()
		var _sobFechar = point_in_rectangle(_mx, _my, _bf.x1, _bf.y1, _bf.x2, _bf.y2)
		if (keyboard_check_pressed(scr_caixaTecla(keybinds.interact)) or (mouse_check_button_pressed(mb_left) and _sobFechar)){
			scr_caixaFechar()
			break
		}

		// ---------------------------------------------
		// FOCO PELO MOUSE (só quando o mouse se mexe, para não brigar com o teclado)
		// ---------------------------------------------
		var _sob = scr_caixaAcharSlot(_mx, _my)
		if (_moveu and _sob != undefined){
			foco = _sob
		}

		// ---------------------------------------------
		// MOUSE: arrastar (guardar lento) e shift + clique (instantâneo)
		// ---------------------------------------------
		if (arrastando == undefined){
			if (mouse_check_button_pressed(mb_left) and _sob != undefined){
				foco = _sob

				if (_sob.caixa and _sob.i >= array_length(global.Caixainventario)){
					// Clicou no "+": expandir a caixa
					scr_caixaExpandir()
				}
				else{
					var _slot = scr_caixaGetSlot(_sob.caixa, _sob.i)
					if (!scr_caixaVazio(_sob.caixa, _sob.i)){
						if (keyboard_check(vk_shift)){
							// Shift + clique: move na hora para o primeiro espaço possível
							scr_caixaTransferir(_sob.caixa, _sob.i)
						}
						else{
							// Começa a arrastar
							arrastando = {deCaixa: _sob.caixa, i: _sob.i, id: _slot[0], qtd: _slot[1]}
						}
					}
				}
			}
		}
		else{
			// Soltou o botão: se estiver sobre a linha do outro lado, move para lá
			if (mouse_check_button_released(mb_left) or !mouse_check_button(mb_left)){
				var _destCaixa = !arrastando.deCaixa
				if (scr_caixaDentroZona(_destCaixa, _mx, _my)){
					var _pref = -1
					if (_sob != undefined and _sob.caixa == _destCaixa and _sob.i < scr_caixaTamanho(_destCaixa)){
						_pref = _sob.i
					}
					scr_caixaTransferir(arrastando.deCaixa, arrastando.i, _pref)
				}
				arrastando = undefined
			}
		}

		// ---------------------------------------------
		// TECLADO: WASD / setas movem o foco, espaço move o item
		// ---------------------------------------------
		var _dx = (keyboard_check_pressed(scr_caixaTecla(keybinds.right)) or keyboard_check_pressed(vk_right))
		        - (keyboard_check_pressed(scr_caixaTecla(keybinds.left)) or keyboard_check_pressed(vk_left))
		var _dy = (keyboard_check_pressed(scr_caixaTecla(keybinds.down)) or keyboard_check_pressed(vk_down))
		        - (keyboard_check_pressed(scr_caixaTecla(keybinds.up)) or keyboard_check_pressed(vk_up))

		if (_dy != 0){
			foco.caixa = (_dy < 0) // cima = caixa, baixo = jogador
			foco.i = min(foco.i, scr_caixaNumNavegaveis(foco.caixa) - 1)
		}
		if (_dx != 0){
			foco.i = clamp(foco.i + _dx, 0, scr_caixaNumNavegaveis(foco.caixa) - 1)
		}

		if (keyboard_check_pressed(vk_space) and arrastando == undefined){
			if (foco.caixa and foco.i >= array_length(global.Caixainventario)){
				scr_caixaExpandir()
			}
			else{
				scr_caixaTransferir(foco.caixa, foco.i)
			}
		}
	break
}