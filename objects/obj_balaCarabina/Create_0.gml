event_inherited()

scr_explosaoParticula(x,y,depth-1,360,4,spr_particulaFogo,6,0.03,0.1)
speed = 20;

if sign(obj_jogador.xScaleReal) == 1 {
    direction = 0;
    image_angle = 0;
} else {
    direction = 180;
    image_angle = 180;
}
alarm[0] = 180
alarm[1] = 3
