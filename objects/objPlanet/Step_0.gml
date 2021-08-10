/// @description Insert description here
// You can write your code in this editor

if (canDelete(id)) {
	instance_destroy();
}

var bullet = instance_place(x, y, objUfoBullet);
if (bullet != noone && death == 0) {
	instance_destroy(bullet);
	death = 1;
	circleAlpha = 1;
}

if (create) {
	create = 0;
	
	var detailsNumber = irandom_range(3, 6);
	details = [];
	for (var i = 0; i < detailsNumber; i++) {
		var detail = {
			image: irandom_range(0, sprite_get_number(sprPlanetDetail)-1),
			xx: irandom_range(0, sprite_width/2)*choose(-1,1),
			yy: irandom_range(0, sprite_height/2)*choose(-1,1),
			angle: irandom(360),
			alpha: random_range(.5, 1)
		}
		array_push(details, detail);
	}

	rings = [];
	if (irandom_range(0, 100) > 60) {
		ringsNumbers = irandom_range(0, 2);
		for (var i = 0; i < ringsNumbers; i++) {
			show_debug_message(sprite_width);
			var imgScale = ((sprite_width == 64) ? 1 : ((sprite_width == 48) ? .75 : ((sprite_width == 32) ? .5 : 1)));
			var ring = {
				scale: imgScale,
				angle: irandom(360)
			}
			array_push(rings, ring);
		}
	}
}