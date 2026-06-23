image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)
var mx_gui = device_mouse_x_to_gui(0);
var my_gui = device_mouse_y_to_gui(0);
var cam = view_camera[0];
var mx_room = camera_get_view_x(cam) + (mx_gui / display_get_gui_width()) * camera_get_view_width(cam);
var my_room = camera_get_view_y(cam) + (my_gui / display_get_gui_height()) * camera_get_view_height(cam);
x = mx_room
y = my_room

if display_text != ""{
	alpha = lerp(alpha,1,0.2)
}
else{
	alpha = lerp(alpha,0,0.2)
}