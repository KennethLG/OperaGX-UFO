/// @description Insert description here
// You can write your code in this editor

if (timeChangeX == 0) {
	timeChangeX = timeChangeXMax;
	xTo = irandom_range(16, camera_get_view_width(view_camera[0]) - 16);
} else {
	timeChangeX = Approach(timeChangeX, 0, 1);
}

yTo = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 32;

dirTo = point_direction(x, y, xTo, yTo);

vx = Approach(vx, lengthdir_x(vMax, dirTo), acc);
vy = Approach(vy, lengthdir_y(vMax, dirTo), acc);

x += vx;
y += vy;
