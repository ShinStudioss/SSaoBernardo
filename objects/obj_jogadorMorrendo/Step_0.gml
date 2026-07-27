if image_index >= image_number-1{
	image_speed = 0
}

mask_index = spr_jogadorParado

// Gravidade
vsp += gravidade;

// Colisão horizontal
if (hsp != 0)
{
    if (place_meeting(x + hsp, y, obj_colisor))
    {
        while (!place_meeting(x + sign(hsp), y, obj_colisor))
            x += sign(hsp);

        hsp = 0;
    }

    x += hsp;
}

// Colisão vertical
if (place_meeting(x, y + vsp, obj_colisor))
{
    while (!place_meeting(x, y + sign(vsp), obj_colisor))
        y += sign(vsp);

    if (vsp > 0)
    {
        vsp = -vsp * quique;

        if (abs(vsp) < 0.5)
            vsp = 0;
    }
    else
    {
        vsp = 0;
    }
}

y += vsp;

// Arrasto
hsp = lerp(hsp, 0, 0.03);

global.pause = true

if audio_is_playing(snd_morte){
	alarm[0] = 40
}

obj_controladorDoJogo.alphaVida = 1