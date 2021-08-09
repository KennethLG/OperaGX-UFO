/// @description Insert description here
// You can write your code in this editor

window_center();

while(yCreate > (camera_get_view_y(view_camera[0]) - 64)) {
	xCreate = irandom_range(0, room_width);
	
	var planet = instance_create_layer(xCreate, yCreate, "Instances", objPlanet);
	planet.sprite_index = planetSprite;
	
	if (!instance_exists(objPlayer)) {
		instance_create_layer(planet.x + (sprite_get_width(planet.sprite_index)/2), planet.y, "Instances", objPlayer);
	}
		
	
	// Configure the fixture
	planet.fix = physics_fixture_create();
	physics_fixture_set_circle_shape(planet.fix, planet.sprite_width / 2);
	physics_fixture_set_density(planet.fix, 0);
	physics_fixture_set_restitution(planet.fix, 0);
	physics_fixture_set_friction(planet.fix, 0.5);

	//Bind the fixture to the current instance
	physics_fixture_bind(planet.fix, planet);
		
	planetSprite = choose(sprPlanet32, sprPlanet48, sprPlanet64);
	planetSize = sprite_get_width(planetSprite)/2;
	planetDistance = (sprite_get_width(planet.sprite_index)/2) + planetSize;
		
	yCreate -= planetDistance;
}


// Camera

var yPlayer = objPlayer.y - (camera_get_view_height(view_camera[0])*.25);
if (yPlayer < yCameraLimit) {
	yCameraLimit = yPlayer;
}

yCamera += ((yCameraLimit-(camera_get_view_height(view_camera[0])/2))-yCamera)*.1;

camera_set_view_pos(
	view_camera[0],
	0,
	yCamera
);

// create UFO

if (objPlayer.y < (room_height/2) && !instance_exists(objUfo)) {
	instance_create_layer(
		room_width/2, 
		camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32,
		"Instances",
		objUfo
	);
}