event_inherited() // atualiza keybinds, distancia e cima (obj_interagivel)

// Animação do contador de dinheiro
escala = lerp(escala,1,0.2)
rotacao = lerp(rotacao,0,0.2)
cor = merge_colour(cor,c_white,0.2)
if shake > 0{
	shake --
}

switch (lojaEstado){
	case 0: // Fechada: espera o clique do jogador
		if (cima and distancia < 70 and !global.pause and !instance_exists(obj_dialogBox)){
			lojaEstado = 1
			global.pause = true
			alarm[0] = 2 // espera o clique "passar" antes de criar os cards
		}
	break

	case 1: // Abrindo
	case 2: // Aberta
		global.pause = true // igual ao obj_comercio
		// O obj_barracao também zera a velocidade do jogador durante a loja;
		// sem isso ele pode continuar deslizando se estava andando ao clicar.
		obj_jogador.speed = 0
		obj_jogador.sprite_index = spr_jogadorParado
	break

	case 3: // Encerrando
		instance_destroy(obj_itemCard)
		instance_destroy(obj_dialogBox)
		global.pause = false
		lojaEstado = 0
	break
}