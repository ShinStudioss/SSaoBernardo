image_alpha = 0;
depth = -9999;

lutdia       = 25;
lutmadrugada = 26;
lutnoite     = 27;
lutentardecer = 28;

// Estado atual
lutId = lut_dia;        // Começa o jogo no dia, por exemplo
lutId_alvo = lut_dia;   // Guarda para qual período o jogo deve ir
intensidade = 1;

intensidade_overlay = 0

global.hora = 20
global.minuto = 0

lutId = lutmadrugada;
lutId_alvo = lutdia;

intensidade_max = 1;
intensidade = intensidade_max;

trocando_lut = false;
velocidade_transicao = 0.01

lutAtual = lutdia;
lutProxima = lutdia;

castShadows = false

autoactivate = true
