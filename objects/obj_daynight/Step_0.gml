global.minuto += 1;

// Desligar poronga 

if (scr_buscarItem(5) != noone) {
									
    if (global.itemSelecionado == scr_buscarItem(5).arrayPos) {
        if (mouse_check_button_pressed(mb_left)) {
            scr_removerItem(5, 1);
            scr_addItem(4, 1);
        }
    }
	
	if (global.hora >= 6 && global.hora <= 17) and autoactivate == false{
		scr_removerItem(5,1);
		scr_addItem(4,1);
		autoactivate = true
	}
	
}

// Ligar poronga 
else if (scr_buscarItem(4) != noone) {
	
    if (global.itemSelecionado == scr_buscarItem(4).arrayPos)  {
        if (mouse_check_button_pressed(mb_left) && global.combustivelPoronga > 0) {
            scr_removerItem(4, 1);
            scr_addItem(5, 1);
        }
    }
	
	if (global.hora >= 18 or global.hora <= 5) and (global.combustivelPoronga > 0) and autoactivate == true{
		scr_removerItem(4,1);
		scr_addItem(5,1);
		autoactivate = false
	}
	
}

if (global.minuto >= 60) {
    global.hora += 1;
    global.minuto = 0;
}

// Acabou o combustível
if (global.combustivelPoronga <= 0) {
    global.combustivelPoronga = 0;

    scr_removerItem(5, 1);

    if (scr_buscarItem(4) == noone) {
        scr_addItem(4, 1);
    }
}

// Reabastecer
if (global.combustivelPoronga <= 0 && scr_buscarItem(6) != noone) {
    if (
        mouse_check_button_pressed(mb_left) &&
        global.itemSelecionado == scr_buscarItem(6).arrayPos
    ) {
        scr_removerItem(6, 1);
        global.combustivelPoronga = 300;

        if (scr_buscarItem(4) != noone) and (global.hora >= 18 or global.hora <= 5) {
            scr_removerItem(4, 1);
            scr_addItem(5, 1);
        }
    }
}

// Consumo de combustível
if (global.combustivelPoronga > 0 && scr_buscarItem(5) != noone) {
    global.combustivelPoronga -= 0.2;
}

if (global.hora >= 24) {
    global.hora = 0;
}

if (instance_exists(obj_jogador)) {
    x = obj_jogador.x;
    y = obj_jogador.y;
}


// Escolha da LUT
if (global.hora >= 6 && global.hora <= 15) {

    lutId_alvo = lutdia;
    image_alpha = lerp(image_alpha, 0, 0.01);

    if (scr_buscarItem(5) != noone) {
        intensity = random_range(0.5, 0.7);
        radius = 256;
        color = make_color_rgb(255, 100, 0);
        image_xscale = 1;
        image_yscale = 1;
    }
    else {
        intensity = 0;
        radius = 256;
        color = c_white;
        image_xscale = 1;
        image_yscale = 1;
    }
}
else if (global.hora >= 16 && global.hora <= 17) {

    lutId_alvo = lutentardecer;
    image_alpha = lerp(image_alpha, 0.3, 0.01);

    if (scr_buscarItem(5) != noone) {
        intensity = random_range(0.5, 0.7);
        radius = 256;
        color = make_color_rgb(255, 100, 0);
    }
    else {
        intensity = 0;
        radius = 256;
        color = c_white;
    }

    image_xscale = 1;
    image_yscale = 1;
}
else if (global.hora >= 18 || global.hora <= 5) {

    lutId_alvo = lutnoite;
    image_alpha = lerp(image_alpha, 1, 0.01);

    if (scr_buscarItem(5) != noone) {
        intensity = random_range(2.8, 3.2);
        radius = 769;
        color = make_color_rgb(255, 100, 0);

        image_xscale = lerp(image_xscale, intensity - 0.5, 0.1);
        image_yscale = lerp(image_yscale, intensity - 0.5, 0.1);
    }
    else {
        radius = 256;
        intensity = 0.2;
        color = c_white;

        image_xscale = 1;
        image_yscale = 1;
    }
}
else {

    lutId_alvo = lutmadrugada;
    image_alpha = lerp(image_alpha, 0.5, 0.01);

    if (scr_buscarItem(5) != noone) {
        intensity = random_range(0.5, 0.7);
        radius = 256;
        color = make_color_rgb(255, 100, 0);
    }
    else {
        intensity = 0.2;
        radius = 256;
        color = c_white;
    }

    image_xscale = 1;
    image_yscale = 1;
}

// Troca somente quando necessário
if (lutId != lutId_alvo) {
    lutId = lutId_alvo;
}

// Intensidade fixa
intensidade = intensidade_max;

var fx_struct = {
    g_LUTColourIntensity : intensidade,
    g_LUTColourTexture   : lutId
};

fx_set_parameters(layer_get_fx("lay_lut"), fx_struct);