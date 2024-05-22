enum tilemap{
	none,
	grass = 13
};


#region Level_0 Creation
/*
#region Create random

randomize();
var noise_grid1 = create_perlin_noise_grid(960, 540, random(1000), random(100), 0.01, 6);
var noise_grid2 = create_perlin_noise_grid(960, 540, random(1000), random(100), 0.02, 6);
var noise_grid3 = create_perlin_noise_grid(960, 540, random(1000), random(100), 0.03, 6);

var _layer0_id = layer_get_id("Tiles");
var _tilemap0_id = layer_tilemap_get_id(_layer0_id);

file = file_text_open_write(game_save_id + "map.txt");
for (var i = 0; i < ds_grid_width(noise_grid1); i++)
{
	
	for (var j = 0; j < ds_grid_height(noise_grid1); j++)
	{
		var _weighted_avg = (ds_grid_get(noise_grid1, i, j) * 0.7 + ds_grid_get(noise_grid2, i, j) * 0.2 + ds_grid_get(noise_grid3, i, j) * 0.1);
		if (_weighted_avg >= 0.25)
		{
			tilemap_set(_tilemap0_id, 10, i, j);
			file_text_write_real(file, 10);
		}
		else if (_weighted_avg >= -0.2)
		{
			tilemap_set(_tilemap0_id, 13, i, j);
			file_text_write_real(file, 13);
		}
		else
		{
			tilemap_set(_tilemap0_id, 45, i, j);
			file_text_write_real(file, 45);
		}
	}
}
file_text_close(file);

#endregion
*/
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
/*
#region Set all grass


var _layer0_id = layer_get_id("Tiles0");
var _layer1_id = layer_get_id("Tiles1");

var _tilemap0_id = layer_tilemap_get_id(_layer0_id);
var _tilemap1_id = layer_tilemap_get_id(_layer1_id);

var _wid = 0
for(var i = 64; i < room_width; i+=64)
{
	var _hei = 0;
	for(var j = 64; j < room_width; j+=64)
	{
		tilemap_set(_tilemap0_id, 13, i - 32, j - 32);
	}
	_wid++;
}


#endregion
*/
#endregion
