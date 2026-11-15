// Cria os cards. Slots já comprados (itemPool = 0) não voltam, mas o card 5 (Encerrar) sempre existe.
for (var i = 0; i < 6; i++)
{
	if (i == 5 || itemPool[i] != 0){
		instance_create_depth(
			0,
			0,
			0,
			obj_itemCard,
			{shopId: i, loja: id}
		)
	}
}

descricao = criar_dialogo([string(descricaoTexto)],0,[])
lojaEstado = 2
