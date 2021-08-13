/// @description Insert description here
// You can write your code in this editor

var kLeft = (keyboard_check(vk_left) || keyboard_check(ord("A")));
var kright = (keyboard_check(vk_right) || keyboard_check(ord("R")));
var kjump = (keyboard_check_pressed(vk_up) || keyboard_check(ord("W"))) && !death;
var kdown = (keyboard_check_pressed(vk_down) || keyboard_check(ord("S"))) && !death;

move = death ? 0 : (kright - kLeft);

image_xscale = move == 0 ? image_xscale : move;

planet = instance_nearest(xSearch, ySearch, objPlanet);
var newPlanet = instance_place(x + phy_speed_x, y + phy_speed_y, objPlanet);

if (newPlanet != noone) {
	if (newPlanet != planet) {
		planet = newPlanet;
	}
}

if (planet != noone) {
	if (instance_exists(planet)) {
		
		var dir = point_direction(x, y, planet.x, planet.y);
		var dirRun = dir + (90*move);
		var dirToJump = point_direction(planet.x, planet.y, x, y);
		
		xSearch = x; //+ lengthdir_x(sprite_height, image_angle + 90);
		ySearch = y; //+ lengthdir_y(sprite_height, image_angle + 90);
		
		

		onGround = place_meeting(x + lengthdir_x(3, dir), y + lengthdir_y(3, dir), objPlanet);
		
		if (move != 0) {
			if (onGround) {
				phy_speed_x = Approach(phy_speed_x, lengthdir_x(1, dirRun), .2);
				phy_speed_y = Approach(phy_speed_y, lengthdir_y(1, dirRun), .2);
			}
		}

		if (onGround) {
			
			if (!canToLand) {
				canToLand = 1;
			}
	
			if (kjump) {
				
				physics_apply_impulse(x, y, lengthdir_x(vJump, dirToJump), lengthdir_y(vJump, dirToJump));
				audio_play_sound(sndJump, 1, 0);
			}
		} else {
			
			if (kdown && canToLand) {
				canToLand = 0;
				physics_apply_impulse(x, y, lengthdir_x(vToLand, dir), lengthdir_y(vToLand, dir));
				audio_play_sound(sndDown, 1, 0);
			}	
		}
		
		planet.alpha = Approach(planet.alpha, 1, .5);
	}
}

physics_apply_force(
		x,
		y,
		lengthdir_x(gravityForce, dir) + ((move == 0 && !onGround) ? 0 : lengthdir_x(vRun, dirRun)),
		lengthdir_y(gravityForce, dir) + ((move == 0 && !onGround) ? 0 : lengthdir_y(vRun, dirRun))
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

if (death == 0) {
	if ((y < planetScore.y) && (objGame.gameScore < planetScore.point)) {
		objGame.gameScore++;
	}	
}

// death
var bullet = instance_place(x, y, objUfoBullet);

var deathByExplosion = (planet.death == 1) && (point_distance(x, y, planet.x, planet.y) < ((planet.sprite_width/2) + 8));

if ((bullet != noone || deathByExplosion) && !death) {
	circleAlpha = 1;
	objGame.timeShakeScreen = objGame.rmSpeed*.5;
	audio_play_sound(sndBang, 1, 0);
	
	var dirKill = deathByExplosion 
		? point_direction(planet.x, planet.y, x, y) 
		: bullet.dir;
	physics_apply_impulse(x, y, lengthdir_x(15, dirKill), lengthdir_y(15, dirKill));
	
	death = 1;
	killGame();
	instance_destroy(bullet);
}

if ((bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) && !death) {
	instance_destroy();
	killGame();
}

if (kright || kLeft || kjump || kdown) {
	if (!objGame.gameStarted) {
		objGame.gameStarted = 1;
	}
}