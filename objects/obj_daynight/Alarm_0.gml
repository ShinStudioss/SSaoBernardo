obj_controladorDoJogo.transitionGoal = 1
if (abs(obj_controladorDoJogo.transition - obj_controladorDoJogo.transitionGoal) < 0.01)
{
    room_goto(rm_barracao)
}
