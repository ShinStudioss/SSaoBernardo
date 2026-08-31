for (var i = 0; i < array_length(global.itens_mundo); i++)
{
    var info = global.itens_mundo[i];

    if (info._room == room)
    {
        var novo_item = instance_create_layer(
            info._x,
            info._y,
            "lay_instances",
            obj_item,
			{item_id: info._id}
        );
    }
}