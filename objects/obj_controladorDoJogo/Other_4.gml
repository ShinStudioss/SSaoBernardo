for (var i = 0; i < array_length(global.itens_mundo); i++)
{
    var info = global.itens_mundo[i];

    // Checa se a struct existe e é válida
    if (info != undefined && is_struct(info)) {
        // Agora o info._room vai encontrar o valor corretamente
        if (info._room == room) {
            instance_create_layer(
                info._x,
                info._y,
                "lay_instances",
                obj_item,
                { item_id: info._id } // Passa o ID para a nova instância
            );
        }
    }
}
