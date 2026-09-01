global.pause = true;

modoLoja = false;
loja = noone;

if (instance_exists(obj_jogador))
{
    obj_jogador.inputX = 0;
    obj_jogador.speed = 0;
}

textArrayIndex = 0;

stretchLerp = 64;

charIndex = 0;

audio_stop_sound(snd_menuHover);
audio_play_sound(snd_menuHover, 2, 0);

obj_controladorDoJogo.larguraCamAlvo =
    1152 * (zoomAmount - 1);

obj_controladorDoJogo.alturaCamAlvo =
    648 * (zoomAmount - 1);