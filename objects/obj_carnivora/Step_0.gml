// Volta suavemente ao tamanho normal
image_xscale = lerp(image_xscale, 1, 0.15);
image_yscale = lerp(image_yscale, 1, 0.15);
switch (estado)
{
    //==========================
    case "aberta":
		image_index = 0
        if (place_meeting(x, y, obj_jogador))
        {
            estado = "esperando";
            timer = tempo_fechar;
        }

    break;

    //==========================
    case "esperando":

        // Se o jogador sair, cancela o ataque
        if (!place_meeting(x, y, obj_jogador))
        {
            estado = "aberta";
            image_index = 0;
        }
        else
        {
            timer--;

            if (timer <= 0)
            {
                // Estica a planta
			    image_xscale = 0.7;
			    image_yscale = 1.8;
				image_index = 1

                // Causa dano
                with (obj_jogador)
                {
                    scr_Dano(other.dano, other.knockback);
                }

                // Entra em recarga
                estado = "recarga";
                timer = tempo_recarga;
            }
        }

    break;

    //==========================
    case "recarga":

        timer--;

        if (timer <= 0)
        {
            estado = "aberta";
            image_index = 1;
        }

    break;
}