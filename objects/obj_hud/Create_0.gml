disp_saude = global.saude
disp_energia = global.energia
disp_fome = global.fome


var pos = 0

repeat(4){
	instance_create_depth(x,y,depth,obj_inventario,{arrayPos: pos})
	pos += 1
}

