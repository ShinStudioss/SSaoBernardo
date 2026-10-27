function scr_sortearSpawns(){
	global.spawnConjunto = {};
	var salas = variable_struct_get_names(global.spawnNpcs);

	for (var i = 0; i < array_length(salas); i++){
		var conjuntos = global.spawnNpcs[$ salas[i]];
		global.spawnConjunto[$ salas[i]] = irandom(array_length(conjuntos) - 1);
	}
}