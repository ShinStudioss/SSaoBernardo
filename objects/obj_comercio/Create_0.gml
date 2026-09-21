if !lojista{
	sprite_index = spr_contrabandista
	image_index = 0
}

//Pool de itens -> [item, preço, quantidade disponivel no dia]

poolItens = [ 
[1,2,irandom_range(4,10)], // 1  Balde vazio
[3,4,irandom_range(1,3)], // 3  Faca de sangria
[4,10,1], // 4  Poronga
[6,3,irandom_range(2,6)], // 6  Querosene
[8,8,1], // 8  Terçado
[9,10,1], // 9  Facão
[10,12,1], // 10 Machadinha
[12,3,irandom_range(1,2)], // 12 Terço
[13,1,irandom_range(4,10)], // 13 Feijão
[14,1,irandom_range(1,3)], // 14 Carne seca
[15,1,irandom_range(6,16)], // 15 Farinha
[21,2,irandom_range(8,20)] //lenha
]

maxItens = 7
itemSelecionado = 0
espacamento = 62
tempoCompra = 90
tempoSegurando = 0
comprando = false
compraArmada = true
mouseSobreItem = false

RodaX = 180
RodaY = 285

