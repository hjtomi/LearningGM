if keyboard_check_pressed(vk_escape)
{
	pause_menu_open = !pause_menu_open;
	pause_menu_just_opened = true;
}

pause_menu_bg.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
pause_menu_bg.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;

exit_button1.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
exit_button1.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - 150;

exit_button2.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
exit_button2.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;

exit_button3.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
exit_button3.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 + 150;

if pause_menu_open
{
	pause_menu_bg.visible = true;
	exit_button1.visible = true;
	exit_button2.visible = true;
	exit_button3.visible = true;
}
else
{
	pause_menu_bg.visible = false;
	exit_button1.visible = false;
	exit_button2.visible = false;
	exit_button3.visible = false;
}

pause_menu_just_opened = false;


















