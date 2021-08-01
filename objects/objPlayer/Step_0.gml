/// @description Insert description here
// You can write your code in this editor

kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kJump = keyboard_check(vk_up);

var move = kRight - kLeft;

// vx and vy control
vx = move != 0 ? Approach(vx, vMax*move, acc) : Approach(vx, 0, fric);

planetGravity = instance_nearest(x, y, objPlanet);
if (planetGravity != noone) {
	
}

x += vx;
y += vy;