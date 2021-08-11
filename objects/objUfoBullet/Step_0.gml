/// @description Insert description here
// You can write your code in this editor

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (bbox_left > room_width || bbox_right < 0) {
	instance_destroy();
}