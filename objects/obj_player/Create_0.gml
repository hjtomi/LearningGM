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

can_move = true;
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

function is_touching_wall()
{
	return (instance_place(x, y, obj_hitbox_level_wall_1) or instance_place(x, y, obj_hitbox_level_wall_2) or instance_place(x, y, obj_hitbox_level_wall_3))
}

// DEPTH SYSTEM
on_level = 0;
on_stairs = 0;
under = 0;

p_on_level = on_level;
p_on_stairs = on_stairs;
p_under = under;

under1_hitbox_list = ds_list_create();
under2_hitbox_list = ds_list_create();
under3_hitbox_list = ds_list_create();
object_under1_hitbox_list = ds_list_create();
object_under2_hitbox_list = ds_list_create();
object_under3_hitbox_list = ds_list_create();

my_under_hitbox = noone;
under_wall = false;
// array_any();

falling = false;
fall_counter = 0;

objects_to_collide_with = [obj_hitbox, obj_player, obj_tree, obj_hitbox_level_wall_1]
