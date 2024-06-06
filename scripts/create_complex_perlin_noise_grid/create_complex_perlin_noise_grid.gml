function create_complex_perlin_noise_grid(grid_width=160, grid_height=90, detail=6, min_value=0, max_value=100){
	
	randomise();
	
	var _noise_grid1 = create_perlin_noise_grid(grid_width*detail, grid_height*detail, random(1000), random(100), 0.01, detail, min_value, max_value);
	var _noise_grid2 = create_perlin_noise_grid(grid_width*detail, grid_height*detail, random(1000), random(100), 0.02, detail, min_value, max_value);
	var _noise_grid3 = create_perlin_noise_grid(grid_width*detail, grid_height*detail, random(1000), random(100), 0.03, detail, min_value, max_value);
	
	var _complex_grid = ds_grid_create(grid_width, grid_height);
	
	for (var i = 0; i < grid_width; i++)
	{
		
		for (var j = 0; j < grid_height; j++)
		{
			var _weighted_avg = (ds_grid_get(_noise_grid1, i, j) * 0.7 + ds_grid_get(_noise_grid2, i, j) * 0.2 + ds_grid_get(_noise_grid3, i, j) * 0.1);
			
			ds_grid_set(_complex_grid, i, j, _weighted_avg);
		}
	}
	
	return _complex_grid;
}