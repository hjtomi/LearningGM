speed_walk_default = 5;
speed_walk = speed_walk_default;

enum swing_direction
{
	left1,
	left2,
	right1,
	right2,
	up1,
	up2,
	down1,
	down2,
};
mouse_x_dist_abs = 0;
mouse_y_dist_abs = 0;
click = false;
swinging = false;
swing_again = false;
current_swing = -1;

w_held = false;
a_held = false;
s_held = false;
d_held = false;

moving = false;

is_pawn = true;
is_warrior = true;
is_archer = true;

chopping = false;

angle = 0;
shooting = false;

/*
hitbox_full = instance_create_depth(x, y, depth, obj_hitbox_warrior_full, {image_xscale:image_xscale, image_yscale:image_yscale});
hitbox_full.owner = id;
hitbox_body = instance_create_depth(x, y, depth, obj_hitbox_warrior_body, {image_xscale:image_xscale, image_yscale:image_yscale});
hitbox_body.owner = id;
*/

on_level = 0;
on_stairs = 0;
p_on_level = on_level;
p_on_stairs = on_stairs;

under_level = 0;
