global.minuto += 0.5
if global.minuto = 60{
	global.hora += 1
	global.minuto = 0
}

if (global.hora > 23) {
    global.hora = 0;
}

if (instance_exists(obj_jogador)) {
    x = obj_jogador.x;
    y = obj_jogador.y;
}

if (global.hora >= 6 && global.hora <= 15) {
    lutId_alvo = lutdia;
	image_alpha = lerp(image_alpha,0,0.01)
}
else if (global.hora >= 16 && global.hora <= 19) {
    lutId_alvo = lutentardecer;
	image_alpha = lerp(image_alpha,0.5,0.01)
}
else if (global.hora >= 20 || global.hora <= 1) {
    lutId_alvo = lutnoite;
	image_alpha = lerp(image_alpha,1.2,0.01)
}
else { 
	image_alpha = lerp(image_alpha,0.8,0.01)
    lutId_alvo = lutmadrugada;
}

// Inicia transição quando a LUT desejada mudar
if (lutId != lutId_alvo && !trocando_lut) {
    trocando_lut = true;
}

// Fade-out
if (trocando_lut) {
    intensidade -= velocidade_transicao;

    if (intensidade <= 0) {
        intensidade = 0;
        lutId = lutId_alvo;
        trocando_lut = false;
    }
}
// Fade-in
else if (intensidade < intensidade_max) {
    intensidade += velocidade_transicao;

    if (intensidade > intensidade_max) {
        intensidade = intensidade_max;
    }
}

var fx_struct = {
    g_LUTColourIntensity : intensidade,
    g_LUTColourTexture   : lutId
};

fx_set_parameters(layer_get_fx("lay_lut"), fx_struct);

show_debug_message($"Hora: {global.hora}")
