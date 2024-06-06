enum states
{
	idle,
	wandering,
	escaping
}

image_xscale = 1.5;
image_yscale = 1.5;

state = states.wandering;

default_new_direction_cooldown = 180;
new_direction_cooldown = default_new_direction_cooldown;
default_wandering_speed = 1;
wandering_x = random_range(-default_wandering_speed, default_wandering_speed);
wandering_y = random_range(-default_wandering_speed, default_wandering_speed);

default_running_speed = 10;
running_speed = default_running_speed;

enemy = noone;