if (global.pause == false) {
    draw_set_halign(fa_middle);
    draw_set_valign(fa_bottom);
    draw_set_font(fnt_hud);

    draw_text(683, 768-45, $"{round(global.horaAlvo - global.hora)} horas até as {global.horaAlvo}h.");

    var horaInicial = global.horaInicial * 60;
    var horaAlvo = global.horaAlvo * 60;

    var progresso = clamp(
        ((global.hora - horaInicial) / (horaAlvo - horaInicial)) * 100,
        0,
        100
    );

    draw_healthbar(
        683-200, 768-30,
        683+200, 768-15,
        progresso,
        c_black,
        c_green,
        c_lime,
        0,
        1,
        1
    );
}