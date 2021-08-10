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
if (planet != noone) {
	if (instance_exists(planet)) {
		var dir = point_direction(x, y, planet.x, planet.y);
		var dirRun = dir + (60*move);

		onGround = place_meeting(x + lengthdir_x(3, dir), y + lengthdir_y(3, dir), objPlanet);

		if (onGround) {
			if (!canToLand) {
				canToLand = 1;
			}
	
			if (kjump) {
				var dirToJump = point_direction(planet.x, planet.y, x, y);
				physics_apply_impulse(x, y, lengthdir_x(vJump, dirToJump), lengthdir_y(vJump, dirToJump));
				audio_play_sound(sndJump, 1, 0);
			}
		} else {
			if (kdown && canToLand) {
				canToLand = 0;
				physics_apply_impulse(x, y, lengthdir_x(vToLand, dir), lengthdir_y(vToLand, dir));
			}	
		}		
	}
}

physics_apply_force(
		x,
		y,
		lengthdir_x(gravityForce, dir) + (move == 0 ? 0 : lengthdir_x(vRun, dirRun)),
		lengthdir_y(gravityForce, dir) + (move == 0 ? 0 : lengthdir_y(vRun, dirRun))
	);

// outbound
if (phy_position_x > (room_width + 16) && phy_speed_x > 0) {
	phy_position_x = 0;
}

if (phy_position_x < -16 && phy_speed_x < 0) {
	phy_position_x = room_width;
}


// score

var planetScore = instance_nearest(
	camera_get_view_x(view_camera[0]) + (room_width/2),
	camera_get_view_y(view_camera[0]) + room_height,
	objPlanet
);

if ((y < planetScore.y) && (objGame.gameScore < planetScore.point)) {
	objGame.gameScore++;
}