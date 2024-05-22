x = ceil(mouse_x / 64) * 64 + 32
y = ceil(mouse_y / 64) * 64

layer = layer_get_id("Instances");

if place_meeting(x, y, [obj_player, obj_building, obj_tree])
{
	sprite_index = spr_house_blue_disallowed;
}
else
{
	sprite_index = spr_house_blue_allowed;

	// Build
	if mouse_check_button_pressed(mb_left)
	{
		// camera_set_view_pos(view_camera[0], obj_player.x + (view_wport / 2), obj_player.y + (view_hport / 2));
		instance_create_layer(x, y, "Instances", obj_building);
		instance_destroy();
	}
}

depth = y * -1;


