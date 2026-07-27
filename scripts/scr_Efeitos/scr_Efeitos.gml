function scr_freeze(time) {
        var _t = current_time + time;
        while (current_time < _t) {
    }
}

function scr_cameraShake(forca)
{
    with (obj_controladorDoJogo)
    {
        shake = max(shake, forca);
    }
}