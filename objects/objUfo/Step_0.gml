/// @description Insert description here
// You can write your code in this editor

if (timeChangeX == 0) {
	timeChangeX = timeChangeXMax;
	xTo = irandom_range(16, camera_get_view_width(view_camera[0]) - 16);
} else {
	timeChangeX = Approach(timeChangeX, 0, 1);
}

if (timeShoot == 0) {

	var bullet = instance_create_layer(x, y, "Instances", objUfoBullet);
	bullet.spd = 2;
	bullet.dir = point_direction(x, y, objPlayer.x, objPlayer.y) + irandom_range(-20, 20);

	timeShoot = timeShootMax;
	
	audio_play_sound(sndShoot, 1, 0);
	circleAlpha = 1;
	circleRadius = 0;
	
	objGame.timeShakeScreen = objGame.rmSpeed*.3;
} else {
	timeShoot = Approach(timeShoot, 0, 1);
}

if (circleAlpha == 0) {
	circleRadius = 0;
} else {
	circleAlpha = Approach(circleAlpha, 0, .1);
	circleRadius += 5;
}

yTo = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 32;

dirTo = point_direction(x, y, xTo, yTo);

vx = Approach(vx, lengthdir_x(vMax, dirTo), acc);
vy = Approach(vy, lengthdir_y(vMax, dirTo), acc);

x += vx;
y += vy;
