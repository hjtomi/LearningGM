#region zoom
if mouse_wheel_up()
{
    width_to -= 128;
    height_to -= 72;
}
else if mouse_wheel_down()
{
    width_to += 128;
    height_to += 72;
}

if width_to > max_width
{
    width_to = max_width;
}
else if width_to < min_width
{
    width_to = min_width;
}

if height_to > max_height
{
    height_to = max_height;
}
else if height_to < min_height
{
    height_to = min_height;
}

cam_width += (width_to - cam_width)/10;
cam_height += (height_to - cam_height)/10;

camera_set_view_size(view_camera[0], cam_width, cam_height);
#endregion

#region movement
if follow != noone
{
    x_to = follow.x;
    y_to = follow.y;
}

if x_to < camera_get_view_width(view_camera[0])/2
{
    x_to = camera_get_view_width(view_camera[0])/2;
}
else if x_to > room_width - camera_get_view_width(view_camera[0])/2
{
    x_to = room_width - camera_get_view_width(view_camera[0])/2;
}

if y_to < camera_get_view_height(view_camera[0])/2
{
    y_to = camera_get_view_height(view_camera[0])/2;
}
else if y_to > room_height - camera_get_view_height(view_camera[0])/2
{
    y_to = room_height - camera_get_view_height(view_camera[0])/2;
}

x += (x_to - x)/5;
y += (y_to - y)/5;

camera_set_view_pos(view_camera[0], x-(cam_width*0.5), y-(cam_height*0.5));
#endregion







