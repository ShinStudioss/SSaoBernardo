keybinds = scr_getBinds()

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);


// ============================================================================
// OPÇÕES
// ============================================================================

var txt1 = optionsStruct[0].text;
var txt2 = optionsStruct[1].text;

var yOffset = string_height_ext(txt1, 36, 1200);

var w1 = string_width_ext(txt1, 36, 1200);
var h1 = string_height_ext(txt1, 36, 1200);

var w2 = string_width_ext(txt2, 36, 1200);
var h2 = string_height_ext(txt2, 36, 1200);


// Área das opções
var option1_x1 = 80;
var option1_y1 = 520;
var option1_x2 = 80 + w1 + 16;
var option1_y2 = 520 + h1 + 8;

var option2_x1 = 80;
var option2_y1 = 520 + yOffset + 8;
var option2_x2 = 80 + w2 + 16;
var option2_y2 = 520 + yOffset + h2 + 16;


// ============================================================================
// MOUSE
// ============================================================================

var mouseOption = noone;

if point_in_rectangle(
    mx, my,
    option1_x1, option1_y1,
    option1_x2, option1_y2
){
    mouseOption = optionsStruct[0];
}

if point_in_rectangle(
    mx, my,
    option2_x1, option2_y1,
    option2_x2, option2_y2
){
    mouseOption = optionsStruct[1];
}


// Selecionou uma opção diferente pelo mouse
if mouseOption != noone && mouseOption != selectedOption {
    selectedOption = mouseOption;

    audio_stop_sound(snd_menuHover);
    audio_play_sound(snd_menuHover, 2, 0);
}


// ============================================================================
// TECLADO
// ============================================================================

if keyboard_check_pressed(keybinds.up){
    selectedOption = optionsStruct[0];

    audio_stop_sound(snd_menuHover);
    audio_play_sound(snd_menuHover, 2, 0);
}

if keyboard_check_pressed(keybinds.down){
    selectedOption = optionsStruct[1];

    audio_stop_sound(snd_menuHover);
    audio_play_sound(snd_menuHover, 2, 0);
}


// ============================================================================
// CONFIRMAR
// ============================================================================

if alarm[0] <= 0 {

    var blink = 0.8 + 0.5 * sin(current_time / 200);

    draw_set_colour(c_white);
    draw_set_alpha(blink * 0.4);


    if (selectedOption == optionsStruct[0]) {

        draw_rectangle(
            option1_x1,
            option1_y1,
            option1_x2,
            option1_y2,
            false
        );
    }


    if (selectedOption == optionsStruct[1]) {

        draw_rectangle(
            option2_x1,
            option2_y1,
            option2_x2,
            option2_y2,
            false
        );
    }


    draw_set_alpha(1);


    // Teclado OU mouse
    if keyboard_check_pressed(keybinds.jump)
    || (mouseOption != noone && mouse_check_button_pressed(mb_left)) {

        instance_destroy();
    }
}