if (global.pause == false) {
    draw_set_halign(fa_middle);
    draw_set_valign(fa_bottom);
    draw_set_font(fnt_hud);

    var minutosAtual = global.hora * 60 + global.minuto;
    var minutosInicial = global.horaInicial * 60;
    var minutosAlvo = global.horaAlvo * 60;

    var horasRestantes = (minutosAlvo - minutosAtual) / 60;

    draw_text(683, 768-45, $"{ceil(horasRestantes)} horas até as {global.horaAlvo}h.");

    var progresso = 0;

    if (minutosAlvo > minutosInicial) {
        progresso = clamp(
            (minutosAtual - minutosInicial) / (minutosAlvo - minutosInicial),
            0,
            1
        );
    }
draw_text(683, 768-80, $"DEBUG: {global.hora}:{global.minuto} | Inicio: {global.horaInicial}");
    draw_healthbar(
        683-200, 768-30,
        683+200, 768-15,
        progresso * 100,
        c_black,
        c_green,
        c_lime,
        0,
        1,
        1
    );
}