socket = network_create_socket(network_socket_ws);
connection_code = network_connect_async(socket, "192.168.1.82", 3000);

client_buffer = buffer_create(1024, buffer_fixed, 1);

show_message("\n\nConnection code: " + string(connection_code));

//room_width = 1920;
//room_height = 1080;
