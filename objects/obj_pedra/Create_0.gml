// Variáveis recebidas na criação: dono, alvoX, alvoY, velH
gravidade = 0.2
dano = 1
rebatida = false
velRebatida = 12

// Calcula a trajetória em arco até a posição do jogador
var _dx = alvoX - x
var _dy = alvoY - y
var _dirH = sign(_dx)
if (_dirH == 0) _dirH = 1

hsp = abs(velH) * _dirH

var _t = max(abs(_dx) / abs(velH), 10)   // tempo de voo em frames
vsp = (_dy - 0.5 * gravidade * _t * _t) / _t

// Chamada pelo ataque do jogador
rebater = function(){
	if (rebatida) exit

	rebatida = true
	scr_explosaoParticula(x, y, depth + 1, 360, 8, spr_particulaGrama, 5, 0.05, 0.1)
}