/// @description Insert description here
// You can write your code in this editor

window_center();

if (canCreate) {
	canCreate = 0;
	
	repeat(3) {
		xCreate = irandom_range(0, room_width);
	
		var planet = instance_create_layer(xCreate, yCreate, "Instances", objPlanet);
		planet.sprite_index = planetSprite;
	
		// Configure the fixture
		planet.fix = physics_fixture_create();
		physics_fixture_set_circle_shape(planet.fix,  planet.sprite_width / 2);
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
}