draw_set_colour(c_black);
draw_sprite(spr_cutsceneBars,0,0,0);
draw_set_alpha(0.6);

draw_rectangle(64-stretchLerp,500-stretchLerp/2,1302+stretchLerp,680+stretchLerp/2,0);

draw_set_colour(c_white);
draw_set_alpha(1);

// texto parcial (letra por letra)
var currentText = textArray[textArrayIndex];
var visibleText = string_copy(currentText, 1, charIndex);

draw_text_ext(88,524, visibleText, 24, 1200);