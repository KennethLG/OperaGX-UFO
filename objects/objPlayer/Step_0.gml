/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("R"))) game_restart();

var kLeft = keyboard_check(vk_left);
var kright = keyboard_check(vk_right);
var kjump = keyboard_check_pressed(vk_up);
var kdown = keyboard_check_pressed(vk_down);

move = kright - kLeft;

image_xscale = move == 0 ? image_xscale : move;

planet = instance_nearest(x, y, objPlanet);
var dir = point_direction(x, y, planet.x, planet.y);
var dirRun = dir + (60*move);
var onGround = place_meeting(x + lengthdir_x(2, dir), y + lengthdir_y(2, dir), objPlanet);

if (onGround) {
	if (!canToLand) {
		canToLand = 1;
	}
	
	if (kjump) {
		var dirToJump = point_direction(planet.x, planet.y, x, y);
		physics_apply_impulse(x, y, lengthdir_x(vJump, dirToJump), lengthdir_y(vJump, dirToJump));
	}
} else {
	if (kdown && canToLand) {
		canToLand = 0;
		physics_apply_impulse(x, y, lengthdir_x(vToLand, dir), lengthdir_y(vToLand, dir));
	}	
}

physics_apply_force(
	x,
	y,
	lengthdir_x(gravityForce, dir) + (move == 0 ? 0 : lengthdir_x(vRun, dirRun)),
	lengthdir_y(gravityForce, dir) + (move == 0 ? 0 : lengthdir_y(vRun, dirRun))
);

// outbound
if (phy_position_x > room_width && phy_speed_x > 0) {
	phy_position_x = 0;
}

if (phy_position_x < 0 && phy_speed_x < 0) {
	phy_position_x = room_width;
}
