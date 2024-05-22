if fallen
{	
	if not has_target
	{
		var _player_id = collision_circle(x, y, 100, obj_player, false, true);
		if _player_id
		{
			has_target = true;
			target = _player_id;
			mask_index = spr_wood_hitbox;
		}
	}
	else
	{
		move_towards_point(target.x, target.y - 23, 20);
		if place_meeting(x, y, target)
		{
			instance_destroy();
		}
	}
}