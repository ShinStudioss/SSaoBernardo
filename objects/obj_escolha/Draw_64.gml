keybinds = scr_getBinds()

if keyboard_check_pressed(keybinds.interact){
	selectedOption = optionsStruct[0]
	audio_stop_sound(snd_menuHover)
	audio_play_sound(snd_menuHover,2,0)
}

if keyboard_check_pressed(keybinds.down){
	selectedOption = optionsStruct[1]
	audio_stop_sound(snd_menuHover)
	audio_play_sound(snd_menuHover,2,0)
}

if alarm[0] <= 0{
	var blink = 0.8 + 0.5 * sin(current_time / 200)

	draw_set_colour(c_white)
	draw_set_alpha(blink * 0.4)

	if (selectedOption == optionsStruct[0]) {
		var txt = optionsStruct[0].text
		var w = string_width_ext(txt,36,1200)
		var h = string_height_ext(txt,36,1200)

		draw_rectangle(80,520, 80 + w + 16, 520 + h + 8, false)
	}

	if (selectedOption == optionsStruct[1]) {
		var txt = optionsStruct[1].text
		var yOffset = string_height_ext(optionsStruct[0].text,36,1200)
		var w = string_width_ext(txt,36,1200)
		var h = string_height_ext(txt,36,1200)

		draw_rectangle(80,520 + yOffset, 80 + w + 16, 520 + yOffset + h + 8, false)
	}

	draw_set_alpha(1)

	if keyboard_check_pressed(keybinds.jump){
		instance_destroy()
	}
}