keybinds = scr_getBinds();

var currentText = textArray[textArrayIndex];

var oldCharIndex = floor(charIndex);

if (charIndex < string_length(currentText)) {
	charIndex += textSpeed;
	audio_stop_sound(snd_menuHover)
	audio_play_sound(snd_menuHover,2,0)
	charIndex = clamp(charIndex, 0, string_length(currentText));
}

var newCharIndex = floor(charIndex);

if (newCharIndex > oldCharIndex)
{
	audio_play_sound(voz, 1, false,,,random_range(0.9,1.4));
}

if keyboard_check_pressed(keybinds.jump) or mouse_check_button_pressed(mb_left) and !instance_exists(obj_escolha){
	if (charIndex < string_length(currentText)) {
		charIndex = string_length(currentText);
	}
	else {
		if textArrayIndex >= array_length(textArray) - 1 {
			global.pause = false;
			instance_destroy();
		} else {
			stretchLerp = 64;
			textArrayIndex += 1;
			charIndex = 0;
		}
	}
}

stretchLerp = lerp(stretchLerp,0,0.2);