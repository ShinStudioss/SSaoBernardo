instance_destroy(obj_dialogBox)
if (contrabando){
	// O próprio obj_contrabandista fecha a loja (estado 3)
	if (instance_exists(loja)){
		loja.lojaEstado = 3
	}
	exit
}
obj_barracao.lojaEstado = 3
