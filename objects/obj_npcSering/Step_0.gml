if (instance_exists(obj_jogador))
{
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