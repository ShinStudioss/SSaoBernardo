function criar_dialogo(
    textoArray_,
    options_,
    optionsStruct_,
    zoomAmt = 1.7,
    som = snd_rabiscoVoz,
    textSpeed = 0.5,
    voiceFrequency = 2
)
{
    var dialogo = noone;

    if (!instance_exists(obj_dialogBox))
    {
        dialogo = instance_create_depth(
            x,
            y,
            depth,
            obj_dialogBox,
            {
                caller: id,
                textArray: textoArray_,
                options: options_,
                optionsStruct: optionsStruct_,
                zoomAmount: zoomAmt,
                voz: som,
                textSpeed: textSpeed,
                voiceFrequency: voiceFrequency
            }
        );
    }

    return dialogo;
}

