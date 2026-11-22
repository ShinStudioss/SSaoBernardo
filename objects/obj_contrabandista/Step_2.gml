// Rede de segurança: com a loja aberta sempre existe uma caixa de diálogo.
// Se o jogador fechar o aviso (clique/espaço depois da animação), ela volta na hora,
// ainda neste frame (antes de desenhar), já com o texto completo e sem fechar.
// Só some quando o obj_itemCard cria outra (item) ou quando a loja encerra.
if (lojaEstado == 2 and !instance_exists(obj_dialogBox)){
	criarDialogoDescricao(false)
	global.pause = true
}