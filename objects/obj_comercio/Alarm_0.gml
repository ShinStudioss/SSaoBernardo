for (var i = 0; i < 6; i++)
{
    var card = instance_create_depth(
        0,
        0,
        0,
        obj_itemCard,
		{shopId: i}
    );


}

descricao = criar_dialogo(["(" + string(descricaoTexto) +")"],0,[])