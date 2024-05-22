if just_hit and not chopped
{
	just_hit = false;
	current_health -= 1;
	image_index = 0;
	sprite_index = spr_tree_hit_strip2;
}

if current_health < 1
{
	chopped = true;
}

if chopped
{
	if not wood_dropped
	{
		wood_dropped = true;
		repeat(wood)
		{
			instance_create_layer(x + round(random_range(-50, 50)), y + round(random_range(-160, -50)), "Instances", obj_wood);	
		}
	}
	sprite_index = spr_tree_chopped;
}

depth = -y;
