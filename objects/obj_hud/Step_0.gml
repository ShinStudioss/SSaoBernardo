var lerpSpeed = 0.1

disp_saude   = lerp(disp_saude, global.saude, lerpSpeed)
disp_energia = lerp(disp_energia, global.energia, lerpSpeed)
disp_fome    = lerp(disp_fome, global.fome, lerpSpeed)

global.saude   = clamp(global.saude,   0, global.saudeMax);
global.energia = clamp(global.energia, 0, global.energiaMax);
global.fome    = clamp(global.fome,    0, global.fomeMax);

keybinds = scr_getBinds()
if keyboard_check_pressed(keybinds.item1) global.itemSelecionado = 0;
if keyboard_check_pressed(keybinds.item2) global.itemSelecionado = 1;
if keyboard_check_pressed(keybinds.item3) global.itemSelecionado = 2;
if keyboard_check_pressed(keybinds.item4) global.itemSelecionado = 3;

if (mouse_wheel_up())
{
    global.itemSelecionado++;

    if (global.itemSelecionado > 3)
        global.itemSelecionado = 0;
}

// Rodinha para baixo
if (mouse_wheel_down())
{
    global.itemSelecionado--;

    if (global.itemSelecionado < 0)
        global.itemSelecionado = 3;
}