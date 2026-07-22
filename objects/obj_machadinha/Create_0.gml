image_index = 10
speed = 12
direction = point_direction(obj_jogador.x,obj_jogador.y,device_mouse_x(0),device_mouse_y(0))
alarm[0] = 30

pickable = false
audio_play_sound(snd_espada1,5,0,0.5,,random_range(0.9,1.3))
audio_play_sound(snd_espada3,5,0,0.5,,random_range(0.9,1.3))

image_xscale = sign(obj_jogador.image_xscale)

depth = obj_jogador.depth -1