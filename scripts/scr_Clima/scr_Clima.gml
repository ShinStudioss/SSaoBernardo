function scr_preverClima()
{
    // Já sorteada: devolve a mesma previsão
    if (global.previsaoCalculada)
        return global.climaAmanha;

    var _sorteio = irandom(99);
    var _proximo = "nublado";

    switch (global.clima)
    {
        case "limpo":
            _proximo = "nublado";
            break;

        case "nublado":
            if (_sorteio < 75) _proximo = "chovendo";
            else _proximo = "limpo";
            break;

        case "chovendo":
            if (_sorteio < 50) _proximo = "limpo";
            else _proximo = "nublado";
            break;
    }

    global.climaAmanha = _proximo;
    global.previsaoCalculada = true;
    return _proximo;
}

function scr_avancarClimaDia()
{
    // O clima de amanhã vira o de hoje
    global.clima = scr_preverClima();

    // Limpa e sorteia a nova previsão
    global.previsaoCalculada = false;
    global.climaAmanha = "";
    global.dicaClima = false;
    scr_preverClima();
}