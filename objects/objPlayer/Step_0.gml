/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("R"))) game_restart();

var kLeft = keyboard_check(vk_left);
var kright = keyboard_check(vk_right);
var kjump = keyboard_check_pressed(vk_up);

move = kright - kLeft;

image_xscale = move == 0 ? image_xscale : move;

planet = instance_nearest(x, y, objPlanet);

var dir = point_direction(x, y, planet.x, planet.y);

var dirRun = dir + (50*move);

var onGround = place_meeting(x + lengthdir_x(2, dir), y + lengthdir_y(2, dir), objPlanet);

if (kjump && onGround) {
	var dirToJump = point_direction(planet.x, planet.y, x, y);
	physics_apply_impulse(x, y, lengthdir_x(vJump, dirToJump), lengthdir_y(vJump, dirToJump));
}

physics_apply_force(
	x,
	y, 
	lengthdir_x(gravityForce, dir) + (move == 0 ? 0 : lengthdir_x(vRun, dirRun)),
	lengthdir_y(gravityForce, dir) + (move == 0 ? 0 : lengthdir_y(vRun, dirRun))
);