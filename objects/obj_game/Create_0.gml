// GUI
pause_menu_open = false;
pause_menu_just_opened = false;

pause_menu_bg = instance_create_depth(x, y, -10000, obj_pause_menu_bg, {visible:false, image_xscale:4, image_yscale:4});
exit_button1 = instance_create_depth(x, y, -10001, obj_exit_button, {visible:false, image_xscale:2, image_yscale:2});
exit_button2 = instance_create_depth(x, y, -10001, obj_exit_button, {visible:false, image_xscale:2, image_yscale:2});
exit_button3 = instance_create_depth(x, y, -10001, obj_exit_button, {visible:false, image_xscale:2, image_yscale:2});

// Cursor
cursor_sprite = _01;
window_set_cursor(cr_none);

#region Level_0 Creation


#region Create random new

var _complex_grid = create_complex_perlin_noise_grid(,,5,-50, 150);

var _layer0_id = layer_get_id("Tiles_ground");
var _tilemap0_id = layer_tilemap_get_id(_layer0_id);

enum tilemap{
	none,
	grass = 13,
	rock = 10,
	rock_top_left = 1,
	rock_top_right = 3,
	rock_bot_left = 17,
	rock_bot_right = 19,
	rock_right = 11,
	rock_top = 2,
	rock_left = 9,
	rock_bot = 18,
	rock_wall_left = 25,
	rock_wall_mid = 26,
	rock_wall_right = 27,
	rock_vert_top = 8,
	rock_vert_mid = 16,
	rock_vert_bot = 24,
	rock_vert_wall = 32,
	rock_hori_left = 41,
	rock_hori_mid = 42,
	rock_hori_right = 43,
	rock_hori_wall_left = 49,
	rock_hori_wall_mid = 50,
	rock_hori_wall_right = 51,
	rock_dot = 48,
	rock_dot_wall = 56,
};


level1_rows = ds_list_create();
level2_rows = ds_list_create();
level3_rows = ds_list_create();

var i = 1;
repeat(ds_grid_width(_complex_grid))
{
	if i > ds_grid_width(_complex_grid)-2 break;
	
	var j = 1;
	repeat(ds_grid_height(_complex_grid))
	{
		if j > ds_grid_height(_complex_grid)-2 break;
		
		var _real_value = ceil(ds_grid_get(_complex_grid, i, j) / 10)
		if _real_value < 1
		{
			 _real_value = 1;
		}
		else if _real_value > 10
		{
			 _real_value = 10;
		}
		
		// Terrain
		if _real_value >= 7
		{
			var _above_value = ceil(ds_grid_get(_complex_grid, i, j-1) / 10)
			var _below_value = ceil(ds_grid_get(_complex_grid, i, j+1) / 10)
			var _left_value = ceil(ds_grid_get(_complex_grid, i-1, j) / 10)
			var _right_value = ceil(ds_grid_get(_complex_grid, i+1, j) / 10)
			
			// Layer doesnt exist
			if ds_list_find_index(level1_rows, j) == -1
			{
				var _layer_name = string(j);
				var _new_layer_id = layer_create(3*64-j*64, _layer_name);
				show_debug_message(layer_get_depth(_new_layer_id));
				var _new_tileset = layer_tilemap_create(_new_layer_id, 0, j*64, Tilemap, 9600, 2);
				ds_list_add(level1_rows, j);
				#region terrain cases
				
				// center piece
				if _above_value >= 7 and _below_value >= 7 and _left_value >= 7 and _right_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock, i, 0);
					instance_create_depth(i*64, j*64, -10000, obj_hitbox_level_wall_1);
				}
				// Top left
				else if _above_value < 7 and _left_value < 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_top_left, i, 0);
				}
				// Top right
				else if _above_value < 7 and _left_value >= 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_top_right, i, 0);
				}
				// Bot left
				else if _above_value >= 7 and _left_value < 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_bot_left, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_wall_left, i, 1);
				}
				// Bot right
				else if _above_value >= 7 and _left_value >= 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_bot_right, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_wall_right, i, 1);
				}
				// Top
				else if _above_value < 7 and _left_value >= 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_top, i, 0);
				}
				// Bot
				else if _above_value >= 7 and _left_value >= 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_bot, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_wall_mid, i, 1);
				}
				// Left
				else if _above_value >= 7 and _left_value < 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_left, i, 0);
				}
				// Right
				else if _above_value >= 7 and _left_value >= 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_right, i, 0);
				}
				// Vert top
				else if _above_value < 7 and _left_value < 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_vert_top, i, 0);
				}
				// Vert mid
				else if _above_value >= 7 and _left_value < 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(_new_tileset, tilemap.rock_vert_mid, i, 0);
				}
				// Vert bot
				else if _above_value >= 7 and _left_value < 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_vert_bot, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_vert_wall, i, 1);
				}
				// Hori left
				else if _above_value < 7 and _left_value < 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_hori_left, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_hori_wall_left, i, 1);
				}
				// Hori mid
				else if _above_value < 7 and _left_value >= 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_hori_mid, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_hori_wall_mid, i, 1);
				}
				// Hori right
				else if _above_value < 7 and _left_value >= 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_hori_mid, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_hori_wall_mid, i, 1);
				}
				// Dot
				else if _above_value < 7 and _left_value < 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(_new_tileset, tilemap.rock_dot, i, 0);
					tilemap_set(_new_tileset, tilemap.rock_dot_wall, i, 1);
				}
				#endregion
				
			}
			else
			{
				// center piece
				if _above_value >= 7 and _below_value >= 7 and _left_value >= 7 and _right_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock, i, 0);
					instance_create_depth(i*64, j*64, -10000, obj_hitbox_level_wall_1);
				}
				// Top left
				else if _above_value < 7 and _left_value < 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_top_left, i, 0);
				}
				// Top right
				else if _above_value < 7 and _left_value >= 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_top_right, i, 0);
				}
				// Bot left
				else if _above_value >= 7 and _left_value < 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_bot_left, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_wall_left, i, 1);
				}
				// Bot right
				else if _above_value >= 7 and _left_value >= 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_bot_right, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_wall_right, i, 1);
				}
				// Top
				else if _above_value < 7 and _left_value >= 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_top, i, 0);
				}
				// Bot
				else if _above_value >= 7 and _left_value >= 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_bot, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_wall_mid, i, 1);
				}
				// Left
				else if _above_value >= 7 and _left_value < 7 and _right_value >= 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_left, i, 0);
				}
				// Right
				else if _above_value >= 7 and _left_value >= 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_right, i, 0);
				}
				// Vert top
				else if _above_value < 7 and _left_value < 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_vert_top, i, 0);
				}
				// Vert mid
				else if _above_value >= 7 and _left_value < 7 and _right_value < 7 and _below_value >= 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_vert_mid, i, 0);
				}
				// Vert bot
				else if _above_value >= 7 and _left_value < 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_vert_bot, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_vert_wall, i, 1);
				}
				// Hori left
				else if _above_value < 7 and _left_value < 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_left, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_wall_left, i, 1);
				}
				// Hori mid
				else if _above_value < 7 and _left_value >= 7 and _right_value >= 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_mid, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_wall_mid, i, 1);
				}
				// Hori right
				else if _above_value < 7 and _left_value >= 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_right, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_hori_wall_mid, i, 1);
				}
				// Dot
				else if _above_value < 7 and _left_value < 7 and _right_value < 7 and _below_value < 7
				{
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_dot, i, 0);
					tilemap_set(layer_tilemap_get_id(layer_get_id(string(j))), tilemap.rock_dot_wall, i, 1);
				}
			}
		}
		else 
		{
			tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles_ground")), tilemap.grass, i, j);
		}
		j++;
	}
	i++;
}
// show_debug_message("Map average value: {0}\nMap value range {1}", ds_grid_get_mean(_complex_grid, 0, 0, 159, 89), ds_grid_get_max(_complex_grid, 0, 0, 159, 89) - ds_grid_get_min(_complex_grid, 0, 0, 159, 89));

#endregion


/*
#region Set saved

var _tiles_id = layer_get_id("Tiles_ground");
var _tilemap0_id = layer_tilemap_get_id(_tiles_id);

file = file_text_open_read(game_save_id + "map.txt");

for (var i = 0; i < 160; i++)
{
	
	for (var j = 0; j < 90; j++)
	{
		tilemap_set(_tilemap0_id, file_text_read_real(file), i, j);
	}
}

file_text_close(file);

#endregion
*/

/*
#region Set all grass

var _layer0_id = layer_get_id("Tiles_ground");

var _tilemap0_id = layer_tilemap_get_id(_layer0_id);

var i = 0;
repeat(tilemap_get_width(_tilemap0_id))
{
	var j = 0;
	repeat(tilemap_get_height(_tilemap0_id))
	{
		tilemap_set(_tilemap0_id, 13, i, j)
		j++;
	}
	i++;
}


#endregion
*/
#endregion

#region Camera

var _camera = camera_create();
camera_set_view_target(_camera, obj_player);


#endregion
