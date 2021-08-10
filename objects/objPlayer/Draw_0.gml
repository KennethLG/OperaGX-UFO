/// @description Insert description here
// You can write your code in this editor

if (death) {
	sprite_index = sprPlayerDeath;
} else {
	if (planet != noone) {
		if (instance_exists(planet)) {
			var dir = point_direction(x, y, planet.x, planet.y);
			var canRun = place_meeting(x + lengthdir_x(4, dir), y + lengthdir_y(4, dir), objPlanet);

			if (move == 0 || (move != 0 && !canRun)) {
				sprite_index = sprPlayer;
			} else {
				sprite_index = sprPlayerRun;
				image_speed = 1;
			}		
		}
	}
}


draw_self();

if (circleAlpha != 0) {
	circleAlpha = Approach(circleAlpha, 0, .1);
	circleRadius += 5;
	
	draw_set_alpha(circleAlpha);
		draw_circle_color(x, y, circleRadius, c_white, c_white, 0);
	draw_set_alpha(1);
}