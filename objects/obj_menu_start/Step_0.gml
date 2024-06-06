if mouse_check_button_pressed(mb_left) and in
{
	clicked = true;
}

if mouse_check_button_released(mb_left) and not in
{
	clicked = false;
}

if mouse_check_button_released(mb_left) and in and clicked
{
	room_goto(rm_game);
}