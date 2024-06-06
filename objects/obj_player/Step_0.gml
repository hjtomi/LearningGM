if (keyboard_check_pressed(ord("1")))
{
	sprite_index = spr_pawn_blue_original;
	is_pawn = true;
	is_warrior = false;
	is_archer = false;
	
	swinging = false;
	swing_again = false;
	
	instance_create_depth(x, y-48, depth, obj_particle_blood);
} 
else if (keyboard_check_pressed(ord("2"))) 
{
	sprite_index = spr_warrior_blue_original;
	is_pawn = false;
	is_warrior = true;
	is_archer = false;
	
	chopping = false;
	
	instance_create_depth(x, y-48, depth, obj_particle_blood);
} 
else if (keyboard_check_pressed(ord("3"))) 
{
	sprite_index = spr_archer_blue_original;
	is_pawn = false;
	is_warrior = false;
	is_archer = true;
	
	chopping = false;
	
	instance_create_depth(x, y-48, depth, obj_particle_blood);
}

var click = mouse_check_button_pressed(mb_left);
mouse_x_dist_abs = abs(x - mouse_x)
mouse_y_dist_abs = abs(y - mouse_y)

var w_held = keyboard_check(ord("W"));
var a_held = keyboard_check(ord("A"));
var s_held = keyboard_check(ord("S"));
var d_held = keyboard_check(ord("D"));

var moving = w_held or a_held or s_held or d_held

var _xinput = d_held - a_held;
var _yinput = s_held - w_held;

if is_warrior
{
	#region depth
	// DEPTH
	
	depth = -y;
	
	// Stairs
	var _stair = instance_place(x,y, obj_hitbox_stair);
	if _stair != noone
	{
		on_stairs = _stair.level;
	}
	else
	{
		on_stairs = 0;
	}
	
	// Surface
	var _surface1 = instance_place(x, y, obj_hitbox_level_surface_1);
	var _surface2 = instance_place(x, y, obj_hitbox_level_surface_2);
	var _surface3 = instance_place(x, y, obj_hitbox_level_surface_3);

	// up
	if p_on_stairs == 1
	{
		if _surface1 != noone
		{
			on_level = 1;
		}
	}
	
	else if p_on_stairs == 2
	{
		if _surface2 != noone
		{
			on_level = 2;
		}
	}
	
	else if p_on_stairs == 3
	{
		if _surface3 != noone
		{
			on_level = 3;
		}
	}
	
	// down
	if p_on_level == 1
	{
		if _surface1 == noone
		{
			on_level = 0;
		}
	}
	
	else if p_on_level == 2
	{
		if _surface2 == noone
		{
			on_level = 1;
		}
	}
	
	else if p_on_level == 3
	{
		if _surface3 == noone
		{
			on_level = 2;
		}
	}
	
	// Wall
	array_pop(objects_to_collide_with);
	if on_level == 0
	{
		array_push(objects_to_collide_with, obj_hitbox_level_wall_1);
	}
	else if on_level == 1
	{
		array_push(objects_to_collide_with, obj_hitbox_level_wall_2);
	}
	else if on_level == 2
	{
		array_push(objects_to_collide_with, obj_hitbox_level_wall_3);
	}
	objects_to_collide_with = array_unique(objects_to_collide_with);
	
	// Under

	ds_list_clear(under1_hitbox_list);
	ds_list_clear(under2_hitbox_list);
	ds_list_clear(under3_hitbox_list);
	
	var _am_under1 = instance_place_list(x, y, obj_hitbox_level_under_1, under1_hitbox_list, false);
	var _am_under2 = instance_place_list(x, y, obj_hitbox_level_under_2, under2_hitbox_list, false);
	var _am_under3 = instance_place_list(x, y, obj_hitbox_level_under_3, under3_hitbox_list, false);
	
	if on_level == 0
	{
		if _am_under1 > 0
		{
			under = 1;
		}
		else
		{
			under = 0;
			instance_destroy(my_under_hitbox);
			my_under_hitbox = noone;
		}
	}
	
	else if on_level == 1
	{
		if _am_under2 > 0
		{
			under = 2;
		}
		else
		{
			under = 0;
			instance_destroy(my_under_hitbox);
			my_under_hitbox = noone;
		}
	}
	
	else if on_level == 2
	{
		if _am_under3 > 0
		{
			under = 3;
		}
		else
		{
			under = 0;
			instance_destroy(my_under_hitbox);
			my_under_hitbox = noone;
		}
	}
	
	// Sajat under hitbox
	if under == 1
	{
		depth += 3 * 64;
		if p_under != 1
		{
			instance_destroy(my_under_hitbox);
			my_under_hitbox = instance_create_depth(x, y, depth, obj_hitbox_level_under_1, {image_xscale:2, image_yscale:2});
		}
	}
	else if under == 2
	{
		depth += 2 * 64;
		if p_under != 2
		{
			instance_destroy(my_under_hitbox);
			my_under_hitbox = instance_create_depth(x, y, depth, obj_hitbox_level_under_2, {image_xscale:2, image_yscale:2});
		}
	}
	else if under == 3
	{
		depth += 64;
		if p_under != 3
		{
			instance_destroy(my_under_hitbox);
			my_under_hitbox = instance_create_depth(x, y, depth, obj_hitbox_level_under_3, {image_xscale:2, image_yscale:2});
		}
	}
	
	if my_under_hitbox
	{
		my_under_hitbox.x = x-64;
		my_under_hitbox.y = y-136;
	}
	
	// Falling off
	if p_on_level == on_level + 1
	{
		if  on_stairs == 0
		{
			falling = true;
			can_move = false;
		}
		else if on_stairs != 0 and is_touching_wall()
		{
			falling = true;
			can_move = false;
		}
	}
	
	if falling
	{
		can_move = false;
		y += 8;
		fall_counter += 8;
		
		if fall_counter == 64
		{
			
			if is_touching_wall()
			{
				y -= 16;
			}
			
			falling = false;
			fall_counter = 0;
			can_move = true;
		}
	}
	
	// show_debug_message("y: {0}\ndepth: {1}\non_stairs: {2}\non_level: {3}\nunder: {4}", y, depth, on_stairs, on_level, under);
	
	#endregion
	
	// MOVEMENT
	
	if (_xinput != 0 and _yinput != 0)
	{
		speed_walk = sqrt(sqr(speed_walk) + sqr(speed_walk)) / 2;
	}

	if not swinging
	{
		if can_move
		{
			move_and_collide(speed_walk * _xinput, speed_walk * _yinput, objects_to_collide_with);
		}

		if a_held{
			image_xscale = -1;
		}

		if d_held{
			image_xscale = 1;
		}
	
		if moving
		{
			sprite_index = spr_warrior_blue_run_strip6;
		}
	
		if ((not w_held) and (not a_held) and (not s_held) and (not d_held) and (not swinging))
		{
			sprite_index = spr_warrior_blue_idle_strip6;
		}
	
		if click
		{
			image_index = 0;
			swinging = true;
			if mouse_x_dist_abs >= mouse_y_dist_abs
			{
				sprite_index = spr_warrior_blue_attack_front1_strip6;
			
				if mouse_x > x
				{
					image_xscale = 1;
					current_swing = swing_direction.right1;
				} 
				else 
				{
					image_xscale = -1;
					current_swing = swing_direction.left1;
				}
			}
			else
			{
				if mouse_y < y
				{
					sprite_index = spr_warrior_blue_attack_up1_strip6;
					current_swing = swing_direction.up1;
				} 
				else 
				{
					sprite_index = spr_warrior_blue_attack_down1_strip6;
					current_swing = swing_direction.down1;
				}
			}
		}
	}

	if swinging and click and image_index > 0
	{
		swing_again = true;
	}

	if swinging and image_index == image_number - 1
	{
		if swing_again
		{	
			image_index = 0;
			// Left
			if current_swing = swing_direction.left1
			{
				sprite_index = spr_warrior_blue_attack_front2_strip6;
				image_xscale = -1;
				current_swing = swing_direction.left2;
			}
			else if current_swing = swing_direction.left2
			{
				sprite_index = spr_warrior_blue_attack_front1_strip6;
				image_xscale = -1;
				current_swing = swing_direction.left1;
			}
		
			// Right
			else if current_swing = swing_direction.right1
			{
				sprite_index = spr_warrior_blue_attack_front2_strip6;
				image_xscale = 1;
				current_swing = swing_direction.right2;
			}
			else if current_swing = swing_direction.right2
			{
				sprite_index = spr_warrior_blue_attack_front1_strip6;
				image_xscale = 1;
				current_swing = swing_direction.right1;
			}
		
			// Up
			else if current_swing = swing_direction.up1
			{
				sprite_index = spr_warrior_blue_attack_up2_strip6;
				image_xscale = 1;
				current_swing = swing_direction.up2;
			}
			else if current_swing = swing_direction.up2
			{
				sprite_index = spr_warrior_blue_attack_up1_strip6;
				image_xscale = 1;
				current_swing = swing_direction.up1;
			}
		
			// Down
			else if current_swing = swing_direction.down1
			{
				sprite_index = spr_warrior_blue_attack_down2_strip6;
				image_xscale = 1;
				current_swing = swing_direction.down2;
			}
			else if current_swing = swing_direction.down2
			{
				sprite_index = spr_warrior_blue_attack_down1_strip6;
				image_xscale = 1;
				current_swing = swing_direction.down1;
			}
		
			swing_again = false;
		}
		else
		{
			swinging = false;
		}
	}

	// Detecting hit
	if swinging
	{
		if image_index == 4
		{
			mask_index = spr_warrior_blue_attack_front1_hitbox;
			var _targets_hit = ds_list_create();
			var _am_hits = instance_place_list(x, y, obj_dummy, _targets_hit, false);
			if _am_hits > 0
			{
				_targets_hit[| 0].y -= 5;
			}
			mask_index = spr_warrior_hitbox_leg;
		}
	}
	/*
	hitbox_full.x = x;
	hitbox_full.y = y;
	hitbox_body.x = x;
	hitbox_body.y = y;
	*/
}
else if is_pawn
{
	if not chopping
	{
		if _xinput != 0 or _yinput != 0
		{
			if _xinput < 0
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
			sprite_index = spr_pawn_blue_run_strip6;
			image_speed = 1;
		}
		else
		{
			sprite_index = spr_pawn_blue_idle_strip6;
			image_speed = 1;
		}
	
		move_and_collide(speed_walk * _xinput, speed_walk * _yinput, [obj_castle, obj_tree, obj_building, obj_player]);
	
		if keyboard_check_pressed(ord("E"))
		{
			instance_create_layer(mouse_x, mouse_y, "Instances", obj_building_indicator);
		}
	}
	
	if mouse_check_button(mb_left) and not chopping
	{
		chopping = true;
		image_index = 0;
		sprite_index = spr_pawn_blue_chop_strip6;
		image_speed = 1;
	}
	
	// Detecting tree
	if chopping and image_index == 3
	{
		mask_index = spr_pawn_blue_chop_hitbox;
		var _tree_id = instance_place(x, y, obj_tree);
		if _tree_id
		{
			_tree_id.just_hit = true;
		}
		mask_index = spr_warrior_hitbox_leg;
	}
	
	if chopping and image_index == 5
	{
		chopping = false;
		sprite_index = spr_pawn_blue_idle_strip6;
		image_speed = 1;
	}
}
else if is_archer
{
	if not shooting
	{
		if (_xinput != 0) or (_yinput != 0)
		{
			sprite_index = spr_archer_blue_run_strip6;
			
			if _xinput < 0
			{
				image_xscale = -1;
			}
			else if _xinput > 0
			{
				image_xscale = 1;
			}
		}
		else
		{
			sprite_index = spr_archer_blue_idle_strip6;
		}
		
		move_and_collide(speed_walk * _xinput, speed_walk * _yinput, [obj_building, obj_tree, obj_castle, obj_player]);
		
		if mouse_check_button_pressed(mb_left)
		{
			angle = point_direction(x, y, mouse_x, mouse_y);
			
			shooting = true;
			image_index = 0;
			
			if x < mouse_x
			{
				image_xscale = 1;
			}
			else if x > mouse_x
			{
				image_xscale = -1;
			}
			
			if angle > 22.5 and angle <= 67.5 // RIGHT DIAGONAL UP
			{
				sprite_index = spr_archer_blue_shoot_diagonal_up_strip8;
			}
			else if angle > 67.5 and angle <= 112.5 // UP
			{
				sprite_index = spr_archer_blue_shoot_up_strip8;
			}
			else if angle > 112.5 and angle <= 157.5 // LEFT DIAGONAL UP
			{
				sprite_index = spr_archer_blue_shoot_diagonal_up_strip8;
			}
			else if angle > 157.5 and angle <= 202.5 // LEFT
			{
				sprite_index = spr_archer_blue_shoot_front_strip8;
			}
			else if angle > 202.5 and angle <= 247.5 // LEFT DIAGONAL DOWN
			{
				sprite_index = spr_archer_blue_shoot_diagonal_down_strip8;
			}
			else if angle > 247.5 and angle <= 292.5 // DOWN
			{
				sprite_index = spr_archer_blue_shoot_down_strip8;
			}
			else if angle > 292.5 and angle <= 337.5 // RIGHT DIAGONAL DOWN
			{
				sprite_index = spr_archer_blue_shoot_diagonal_down_strip8;
			}
			else // RIGHT
			{
				sprite_index = spr_archer_blue_shoot_front_strip8;
			}
		}
	}
	else
	{
		if image_index == 6
		{
			var _arrow = instance_create_layer(x, y - 27, "Instances", obj_arrow,
			{
				direction: angle,
				image_angle: angle,
				speed: 20
			});
		}
	}
}
