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