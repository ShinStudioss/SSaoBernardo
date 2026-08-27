function scr_DropItem(item,posX,posY,camada,quantia){
	instance_create_depth(posX,posY,camada,obj_item, {item_id: item, quantidade: quantia})
}