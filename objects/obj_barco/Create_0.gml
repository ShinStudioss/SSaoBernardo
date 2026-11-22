x = 1757
y = 556

yInicial = y;
tempo = 0;
speed = -2

with obj_contrabandista{
	scr_explosaoParticula(x,y,depth+1,360,30,spr_particulaGrama,10,0.03,0.1)
	audio_play_sound(snd_menuConfirm,7,0)
	
}

instance_destroy(obj_enemy)

// Distância para poder interagir
distanciaInteracao = 90

// Marcação de que o barco está partindo (para você usar na animação)
partindo = false

// Chamada quando o jogador escolhe "Sim, ir embora"
ir_embora = function(){
	partindo = true
	global.pause = false

	obj_controladorDoJogo.transitionGoal = 1
	alarm[0] = 60
}