// =====================================================
// OBJ_DIALOGBOX - STEP
// =====================================================

if (modoLoja)
{
    exit;
}


keybinds = scr_getBinds();

var currentText =
    textArray[textArrayIndex];

var oldCharIndex =
    floor(charIndex);


// Escreve o texto
if (charIndex < string_length(currentText))
{
    charIndex += textSpeed;

    charIndex = clamp(
        charIndex,
        0,
        string_length(currentText)
    );
}


var newCharIndex =
    floor(charIndex);


// Som da voz
if (newCharIndex > oldCharIndex)
{
    for (
        var i = oldCharIndex + 1;
        i <= newCharIndex;
        i++
    )
    {
        if (i mod voiceFrequency == 0)
        {
            audio_play_sound(
                voz,
                1,
                false,
                ,
                ,
                random_range(0.9, 1.4)
            );
        }
    }
}


// Avançar diálogo
if (
    (
        keyboard_check_pressed(keybinds.jump)
        || mouse_check_button_pressed(mb_left)
    )
    && !instance_exists(obj_escolha)
)
{
    if (charIndex < string_length(currentText))
    {
        charIndex =
            string_length(currentText);
    }
    else
    {
        if (
            textArrayIndex
            >= array_length(textArray) - 1
        )
        {
            global.pause = false;

            instance_destroy();
        }
        else
        {
            stretchLerp = 64;
            textArrayIndex += 1;
            charIndex = 0;
        }
    }
}


stretchLerp =
    lerp(stretchLerp, 0, 0.2);tchLerp = lerp(stretchLerp, 0, 0.2);