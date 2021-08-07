/// @description Insert description here
// You can write your code in this editor

window_center();

var screenSize = 8;

if (canCreate) {
	canCreate = 0;
	
	var yy = yCreate;
	
	for (var i = yy; i < (yy + screenSize); i++) {
		instance_create_layer(0, room_height - 32 - (i*16), "Instances", objBlock);
	}
}

//var screenWidth = display_get_width();
//var screenHeight = display_get_height();

//var cameraWidth = camera_get_view_width(view_camera[0]);
//var cameraHeight = camera_get_view_height(view_camera[0]);

//view_set_xport(view_camera[0], (screenWidth/2) - (cameraWidth/2));
//view_set_yport(view_camera[0], (screenHeight/2) - (cameraHeight/2));