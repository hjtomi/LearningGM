function create_perlin_noise_grid(_width, _height, _X, _Y_start, _inc, _every_xth_element){

var _noise_grid = ds_grid_create(ceil(_width / _every_xth_element), ceil(_height / _every_xth_element));
var _insert_x = 0;
var _insert_y = 0;

for (var col = 0; col < _width; col += 1) {
			
	var Y = _Y_start;
	_insert_y = 0;
	
	if (col % _every_xth_element == 0){
		
		for (var row = 0; row < _height; row += 1) {
			
			var _val = perlin_noise(_X, Y);
			
			if (row % _every_xth_element == 0){
			
				ds_grid_set(_noise_grid, _insert_x, _insert_y, _val);
				_insert_y++;
			}
				
			Y += _inc;
		}
		
		_insert_x++;
		
	}
			
	_X += _inc;
	
}

return _noise_grid;

}