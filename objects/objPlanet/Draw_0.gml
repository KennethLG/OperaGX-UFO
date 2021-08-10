/// @description Insert description here
// You can write your code in this editor

var lightScale;
if (sprite_width == 64) lightScale = 1;
else if (sprite_width == 48) lightScale = .75;
else lightScale = .5;

draw_sprite_ext(sprPlanetLight, 0, x, y, lightScale, lightScale, 0, color, (alpha*.5));
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, angle, color, alpha);

for (var i = 0; i < array_length(details); i++) {
	draw_sprite_ext(
		sprPlanetDetail, 
		details[i].image, 
		x + details[i].xx, 
		y + details[i].yy, 
		1, 1, 
		details[i].angle, 
		c_white, 
		details[i].alpha*detailsAlpha
	);
}

for (var i = 0; i < array_length(rings); i++) {
	draw_sprite_ext(
		sprPlanetRing,
		0, x, y,
		rings[i].scale,
		rings[i].scale,
		rings[i].angle,
		c_white,
		detailsAlpha
	);
}

// death

if (death == 1) {
	alpha = Approach(alpha, 0, .1);
	circleAlpha = Approach(circleAlpha, 0, .1);
	circleRadius += 10;
	
	detailsAlpha = Approach(detailsAlpha, 0, .1);
	if (detailsAlpha == 0) {
		instance_destroy();
	}
	draw_set_alpha(circleAlpha);
	draw_circle_color(x, y, circleRadius, color, color, 0);
	draw_set_alpha(1);
} else {
	alpha = Approach(alpha, alphaTo, alphaVel);
	if (alpha == alphaTo) {
		alphaTo = (alphaTo == alphaEnd) ? alphaStart : alphaEnd;
	}
}