/// @description Insert description here
// You can write your code in this editor

if (canDelete(id)) {
	instance_destroy();
}

var bullet = instance_place(x, y, objUfoBullet);
if (bullet != noone) {
	instance_destroy(bullet);
	instance_destroy(id);
}