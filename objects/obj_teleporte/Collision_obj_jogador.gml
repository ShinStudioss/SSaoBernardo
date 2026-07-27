global.transitionX = xx
global.transitionY = yy
global.pause = true
obj_controladorDoJogo.transitionGoal = 1

if (abs(obj_controladorDoJogo.transition - obj_controladorDoJogo.transitionGoal) < 0.01)
{
    room_goto(destino)
}
