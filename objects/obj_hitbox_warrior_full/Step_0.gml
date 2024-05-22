var _am_hits = instance_place_list(x, y, [obj_hitbox_warrior_full, obj_hitbox_tree_full], hits, false);
var _on_level_1 = false;

// NOTHING IN FULL HITBOX
if _am_hits == 0
{
	owner.depth = 0;
}
else
{
	// HIGHEST
	var _highest = true;
	var i = 0;
	repeat(_am_hits)
	{
		if ds_list_find_value(hits, i).y <= y
		{
			_highest = false;
		}
		i++;
	}
	if _highest
	{
		owner.depth = 0;
	}
	
	// NOT HIGHEST, HAS HITS
	else
	{
		i = 0;
		repeat(_am_hits)
		{
			if ds_list_find_value(hits, i).y < y
			{
				ds_list_add(depths_of_instances_higher, ds_list_find_value(hits, i).depth);
			}
			i++;
		}
		ds_list_sort(depths_of_instances_higher, true);
		owner.depth = ds_list_find_value(depths_of_instances_higher, 0) - 1;
	}
}
depth = owner.depth;

ds_list_clear(hits);
ds_list_clear(depths_of_instances_higher);