draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_black);
draw_sprite(spr_cutsceneBars,0,0,0);
draw_set_alpha(0.6);

draw_rectangle(64-stretchLerp,500-stretchLerp/2,1302+stretchLerp,680+stretchLerp/2,0);

draw_set_colour(c_white);
draw_set_alpha(1);

var currentText = textArray[textArrayIndex];
var visibleText = string_copy(currentText, 1, charIndex);

draw_text_ext(88,524, visibleText, 36, 1200);

if options and currentText = ""{
	if !instance_exists(obj_escolha){
		instance_create_depth(x,y,depth,obj_escolha,{caixaPai: id})
	}
	draw_text_ext(88,524,optionsStruct[0].text,36,1200)
	draw_text_ext(88,524 + string_height_ext(optionsStruct[0].text,36,1200),optionsStruct[1].text,36,1200)
}