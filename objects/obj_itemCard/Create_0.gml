// Loja que criou este card (obj_comercio ou obj_contrabandista).
// Ela é enviada no struct do instance_create; o fallback só existe por segurança.
if (!variable_instance_exists(id, "loja")){
	loja = (room == rm_barracao) ? obj_comercio : obj_contrabandista
}
contrabando = (loja.object_index == obj_contrabandista)

// Estado da loja: no barracão quem controla é o obj_barracao,
// no contrabandista é o próprio obj_contrabandista.
estadoLoja = function(){
	if (contrabando){
		return instance_exists(loja) ? loja.lojaEstado : -1
	}
	return obj_barracao.lojaEstado
}

// O card 5 é o "Encerrar negociações" e não tem item
if (shopId != 5){
	itemreal = loja.itemPool[shopId]
	item = scr_getItem(itemreal)

	// Preço cobrado (o contrabandista dá desconto nos itens do comercio)
	if (contrabando){
		preco = loja.calcularPreco(itemreal, item)
	}
	else{
		preco = item.preco
	}

	// Quantidade em estoque. Só itens com "quantidade" no scr_getItem têm mais de 1;
	// os demais somem do card na primeira compra. O estoque fica guardado na loja
	// (loja.estoque), então não reinicia quando o card é recriado ao reabrir a loja.
	if (!variable_instance_exists(loja, "estoque")){
		loja.estoque = array_create(6, -1)
	}
	comQuantidade = variable_struct_exists(item, "quantidade")
	if (loja.estoque[shopId] == -1){
		loja.estoque[shopId] = comQuantidade ? item.quantidade : 1
	}
	quantidade = loja.estoque[shopId]
}

// ID do item na loja
largura = 192;
altura = 160;
espaco = 16;

var larguraTotal = 6 * largura + 5 * espaco;

x = (display_get_gui_width() - larguraTotal) / 2
    + shopId * (largura + espaco);

y = 96;

escala = 1;
escalaAlvo = 1;

if (shopId == 5)
{
    nome = "Encerrar\nnegociações";
}
