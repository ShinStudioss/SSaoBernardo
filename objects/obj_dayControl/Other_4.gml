if room = rm_dayTransition{
	global.pause = true
	if dayMode = "dia" { alarm[0] = 60 }
	else{ alarm[2] = 60 }
}