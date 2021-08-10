/// @description Insert description here
// You can write your code in this editor

draw_set_font(gameFont);
draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), "score : " + string(gameScore));

if (death) {
	yLayout += (camera_get_view_y(view_camera[0])-yLayout)*.1;
	
	draw_set_alpha(.5);
		draw_rectangle_color(
			camera_get_view_x(view_camera[0]) - 8,
			yLayout,
			camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
			camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),
			c_black, c_black, c_black, c_black, 0
		);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
		draw_text(
			camera_get_view_x(view_camera[0]) + (room_width/2), 
			camera_get_view_y(view_camera[0]) + (room_height/2),
			messages[msg]
		);
	draw_set_halign(fa_left);
}