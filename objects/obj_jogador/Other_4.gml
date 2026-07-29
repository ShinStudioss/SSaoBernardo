var max_tentativas = room_height;

while (place_meeting(x, y, obj_colisor) && max_tentativas > 0)
{
    y--;
    max_tentativas--;
}