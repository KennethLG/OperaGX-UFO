/// @description Insert description here
// You can write your code in this editor

if (circleAlpha != 0 && circleRadius != 0) {
	draw_set_alpha(circleAlpha);
	draw_circle_color(x, y, circleRadius, c_white, c_white, 0);
	draw_set_alpha(1);
}

draw_self();