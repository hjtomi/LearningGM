/// @description Perlin Noise 2D


if (not_drawn) {


	if (surface_exists(perlin_noise_surface)) {
		surface_set_target(perlin_noise_surface);

		
		for (var col = 0; col < perlin_noise_width; col += 1) {
			
			var Y = Y_start;
			for (var row = 0; row < perlin_noise_height; row += 1) {
				
				var _val = perlin_noise(X, Y);
				var _col_val = map_value(_val, -1, 1, 0, 255);
				
				/*
				if (_col_val > 200 and _col_val <= 255){
					_col_val = 0;
				} else {
					_col_val = 255;
				}
				*/
				
				draw_set_color(make_color_rgb(_col_val, _col_val, _col_val));
				draw_rectangle(col, row, col + 1, row + 1, false);	
				
				Y += inc;
			}	
			
			X += inc;
		}

		surface_reset_target();
	}

	not_drawn = false;
}

draw_surface(perlin_noise_surface, 0, 0);

