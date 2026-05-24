if (global.hora >= 6 && global.hora < 18)
{
	image_alpha = (global.hora - 6) / 12;
}
else
{
	var hora_noite;

	if (global.hora >= 18)
		hora_noite = global.hora - 18;
	else
		hora_noite = global.hora + 6;
	image_alpha = 1 - (hora_noite / 12);
}