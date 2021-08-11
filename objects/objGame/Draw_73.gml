/// @description Insert description here
// You can write your code in this editor

draw_set_font(gameFont);

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
			camera_get_view_y(view_camera[0]) + 32,
			"Planets record : " + string(gameScore)
		);
		draw_text(
			camera_get_view_x(view_camera[0]) + (room_width/2),
			camera_get_view_y(view_camera[0]) + 44,
			"Galaxies record : " + string(galaxies)
		);
		draw_text(
			camera_get_view_x(view_camera[0]) + (room_width/2), 
			camera_get_view_y(view_camera[0]) + (room_height/2),
			string(messages[msg]) +"\nPress ENTER to continue"
		);
	draw_set_halign(fa_left);
} else {
	
	if (gameStarted) {
		draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), "Planets: " + string(gameScore));
		draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 12, "Galaxies: " + string(galaxies));
	} else {
		draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), "Planets Record: " + string(gameScoreRecord));
		draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 12, "Galaxies Record: " + string(galaxiesRecord));
	}
}