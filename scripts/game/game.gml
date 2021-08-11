// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function killGame(){
	if (objGame.death == 0) {
		randomize();
		objGame.death = 1;
		objGame.yLayout = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
		objGame.msg = irandom(array_length(objGame.messages)-1);
	}
}