// Inherit the parent event
event_inherited();
if (global.hora > 18 and global.hora < 23) or (global.hora > 00 and global.hora < 5){
	intensity = 2
	radius = 256
}
else{
	intensity = 1
	radius = 128
}
