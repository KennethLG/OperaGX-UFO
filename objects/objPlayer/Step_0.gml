/// @description Insert description here
// You can write your code in this editor

kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kJump = keyboard_check_pressed(vk_up);

onGround = place_meeting(x, y + 1, objBlock);

var move = kRight - kLeft;

vx = move != 0 ? Approach(vx, vMax*move, acc) : Approach(vx, 0, fric);

if (!onGround) {
	vy = Approach(vy, grvMax, grvAcc);
} else {
	vy = 0;
	if (kJump) {
		vy = -vJump;
	}
}

var planet = instance_nearest(x, y, objPlanet);
if (planet != noone) {
	
}

if (place_meeting(x + vx, y, objBlock)) {
  while(!place_meeting(x + sign(vx), y, objBlock)) x += sign(vx);
} else x += vx;
  
if (place_meeting(x, y + vy, objBlock)) {
  while(!place_meeting(x, y + sign(vy), objBlock)) y += sign(vy);
} else y += vy;