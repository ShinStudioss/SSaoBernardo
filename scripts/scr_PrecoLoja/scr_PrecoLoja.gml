function scr_PrecoLoja(_id)
{
    switch (_id)
    {
        case 1:  return 20;  // Balde vazio
        case 2:  return 5;   // Látex
        case 3:  return 50;  // Faca de sangria
        case 4:  return 35;  // Poronga
        case 5:  return 60;  // Poronga acesa
        case 6:  return 15;  // Querosene
        case 7:  return 10;  // Bola de borracha
        case 8:  return 70;  // Terçado
        case 9:  return 65;  // Facão
        case 10: return 55;  // Machadinha
        case 11: return 5;   // Galho
        case 12: return 25;  // Terço
        case 13: return 15;  // Feijão
        case 14: return 25;  // Carne seca
        case 15: return 10;  // Farinha
        case 16: return 30;  // Mel
        case 17: return 200; // Espingarda
        case 18: return 300; // Carabina
        case 19: return 10;  // Munição Esp.
        case 20: return 12;  // Munição Car.
    }

    return 0;
}

function scr_wrap(_valor, _minimo, _maximo)
{
    var tamanho = _maximo - _minimo + 1;

    return _minimo + ((_valor - _minimo) mod tamanho + tamanho) mod tamanho;
}