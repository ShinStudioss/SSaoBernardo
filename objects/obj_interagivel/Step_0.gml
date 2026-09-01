keybinds = scr_getBinds();

distancia = distance_to_object(obj_jogador);

cima = mouse_check_button_pressed(mb_left)
    && point_in_rectangle(
        mouse_x,
        mouse_y,
        bbox_left,
        bbox_top,
        bbox_right,
        bbox_bottom
    );


// =====================================================
// ABRIR LOJA
// =====================================================

// Essa parte só pode ser executada pelo obj_comercio.
// Os outros filhos do obj_interagivel ignoram completamente.

if (
    object_index == obj_comercio
    && cima
    && distancia < 70
    && !global.pause
    && !instance_exists(obj_dialogBox)
    && !instance_exists(obj_loja)
)
{
    instance_create_depth(
        0,
        0,
        100000,
        obj_loja,
        {
            vendedor: id
        }
    );
}