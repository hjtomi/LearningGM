
switch(state)
{
	case states.idle:
		
		sprite_index = spr_sheep_idle;
		image_speed = 1;
		
		break;
		
	case states.wandering:
		
		sprite_index = spr_sheep_bouncing;
		image_speed = 1;
		
		if wandering_x < 0
		{
			image_xscale = -1.5;
		}
		else if wandering_x > 0
		{
			image_xscale = 1.5;
		}
		
		x += wandering_x;
		y += wandering_y;
		
		new_direction_cooldown -= 1;
		
		if new_direction_cooldown < 0
		{
			new_direction_cooldown = default_new_direction_cooldown;
			wandering_x = random_range(-default_wandering_speed, default_wandering_speed);
			wandering_y = random_range(-default_wandering_speed, default_wandering_speed);
		}
		
		enemy = collision_circle(x, y, 500, obj_player, false, true);
		if enemy
		{
			state = states.escaping;
		}
		
		break;
		
	case states.escaping:
		
		sprite_index = spr_sheep_bouncing;
		image_speed = 1;
		
		if wandering_x < 0
		{
			image_xscale = -1.5;
		}
		else if wandering_x > 0
		{
			image_xscale = 1.5;
		}
		
		x += wandering_x;
		y += wandering_y;
		
		new_direction_cooldown -= 1;
		
		if new_direction_cooldown < 0
		{
			new_direction_cooldown = default_new_direction_cooldown;
			wandering_x = random_range(-default_wandering_speed, default_wandering_speed);
			wandering_y = random_range(-default_wandering_speed, default_wandering_speed);
		}
		
		break;
}




























