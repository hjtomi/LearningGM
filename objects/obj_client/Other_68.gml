var _type = ds_map_find_value(async_load, "type");

switch(_type)
{
	case network_type_data:
		show_message("Data recieved!");
		
		var _buffer = ds_map_find_value(async_load, "buffer");
		var _size = ds_map_find_value(async_load, "size");
		var _message_type = ds_map_find_value(async_load, "message_type");
		
		var _code = buffer_read(_buffer,buffer_u8);
		if _code == 1
		{
			instance_create_depth(100, 100, -5000, obj_player);
		}
		
		break;
}