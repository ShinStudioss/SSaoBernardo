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

if scr_buscarItem(7) != noone{
	alarm[1] = 1
	scr_removerItem(7,1)
}
descricao = criar_dialogo([string(descricaoTexto)],0,[])