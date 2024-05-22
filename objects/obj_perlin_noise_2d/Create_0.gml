/// @description Perlin Noise 2D
perlin_noise_width = 960;
perlin_noise_height = 540;

perlin_noise_surface = surface_create(perlin_noise_width, perlin_noise_height);
not_drawn = true;


Y_start = random(1000);
X = random(1000);
inc = 0.01;