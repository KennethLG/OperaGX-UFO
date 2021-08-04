/// @description Insert description here
// You can write your code in this editor

if (vx == 0) {
	imageSpeed = 0;
} else {
	imageSpeed = 0.5;
	image_xscale = sign(vx);
}

image_speed = imageSpeed;

draw_self();

draw_line_color(x, y, x + lengthdir_x(8, faceDir), y + lengthdir_y(8, faceDir), c_red, c_red);
