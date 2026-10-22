if (instance_exists(obj_jogador))
{
	//arrume a respiração se achar necessario
	var escalaAlvo = 1 + sin(current_time / 250) * 0.03;

	escalaRespiracao = lerp(escalaRespiracao, escalaAlvo, 0.08);
	image_yscale = escalaRespiracao;
    var jogador = instance_nearest(x, y, obj_jogador)
    var distancia = point_distance(x, y, jogador.x, jogador.y)

    if (distancia < 70) && !instance_exists(obj_dialogBox)
    {
        if (place_meeting(x, y, obj_cursor))
        {
            if (mouse_check_button_pressed(mb_left)
            && novo_dialogo)
            {
                if (jogador.x < x)
                {
                    image_xscale = -1
                }
                else
                {
                    image_xscale = 1
                }

                novo_dialogo = false
				if npc_tipo = "estevao"{
					if global.dicaClima{
						dialogoNPC = [
		                "Estevão: Vai trabalhar, Raimundo.",
		                "As dividas tão grande e ainda tem o juros.",
		                "Ah, cê quer saber sobre o clima?",
						"Vai tá "+climaAmanha+" amanhã."
						];
					}
					else{
						global.dicaClima = true
					}
				}
                criar_dialogo(
                    dialogoNPC,
                    false,
                    {}
                );
            }
        }
    }
    else{
        alarm[0] = 30
    }
}

