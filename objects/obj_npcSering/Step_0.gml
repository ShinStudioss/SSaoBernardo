// ANIMAÇÃO DE RESPIRAÇÃO
var escalaAlvo = 1 + sin(current_time / 250) * 0.015;

escalaRespiracao = lerp(escalaRespiracao, escalaAlvo, 0.08);
image_yscale = escalaRespiracao;

// INTERAÇÃO COM O JOGADOR
if (instance_exists(obj_jogador))
{
    var jogador = instance_nearest(x, y, obj_jogador);
    var distancia = point_distance(x, y, jogador.x, jogador.y);

    if (distancia < 48)
    {
        // Pressione E para conversar
        if (keyboard_check_pressed(ord("E"))
        && !instance_exists(obj_dialogBox))
        {
            // Vira para o jogador.
            // Considera que o sprite original olha para a direita.
            if (jogador.x < x)
            {
                image_xscale = 1;
            }
            else
            {
                image_xscale = -1;
            }

            // Abre o diálogo usando o sistema já existente.
            criar_dialogo(
                dialogoNPC,
                false,
                {}
            );
        }
    }
}