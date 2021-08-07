/// @description Insert description here
// You can write your code in this editor

if (move == 0) {
	image_index = 0;
	image_speed = 0;
} else {
	image_speed = 1;
}

draw_self();

draw_text(0, 0, x);
draw_text(0, 16, room_width);