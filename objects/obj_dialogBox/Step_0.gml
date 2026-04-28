keybinds = scr_getBinds();

var currentText = textArray[textArrayIndex];

if (charIndex < string_length(currentText)) {
	charIndex += textSpeed;
	charIndex = clamp(charIndex, 0, string_length(currentText));
}

if keyboard_check_pressed(keybinds.jump){
	if (charIndex < string_length(currentText)) {
		charIndex = string_length(currentText);
	}
	else {
		if textArrayIndex >= array_length(textArray) - 1 {
			global.pause = false;
			instance_destroy();
		} else {
			stretchLerp = 64;
			textArrayIndex += 1
			charIndex = 0
		}
	}
}

stretchLerp = lerp(stretchLerp,0,0.2);