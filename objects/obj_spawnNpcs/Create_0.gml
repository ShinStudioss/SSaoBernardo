var yPadrao = 480;
var sala = room_get_name(room);

if variable_struct_exists(global.spawnNpcs, sala){
	var lista = global.spawnNpcs[$ sala][global.spawnConjunto[$ sala]];

	for (var i = 0; i < array_length(lista); i++){
		var pos = lista[i];
		var px, py;

		if is_array(pos){
			px = pos[0];
			py = pos[1];
		}
		else{
			px = pos;
			py = yPadrao;
		}

		instance_create_depth(px, py, 0, obj_npcSering);
	}
}