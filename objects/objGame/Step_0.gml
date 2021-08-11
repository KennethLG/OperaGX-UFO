/// @description Insert description here
// You can write your code in this editor

window_center();

if (keyboard_check_pressed(ord("R"))) game_restart();

while(yCreate > (camera_get_view_y(view_camera[0]) - 64)) {
	xCreate = gameScore > 50 
	? irandom_range(0, room_width) 
	: clamp(xCreate + irandom_range(-64, 64), 0, room_width);
	
	var planet = instance_create_layer(xCreate, yCreate, "Instances", objPlanet);
	planet.sprite_index = planetSprite;
	
	maxScore++;
	if (maxScore*5 >= planetsScore) {
		planetsScore += 255;
		galaxies++;
	}
	
	
	planet.point = maxScore;
	planet.hue = clamp((255 - (maxScore*5)) + irandom_range(-10, 10), 0, 255);
	planet.color = make_color_hsv(planet.hue, irandom_range(150, 255), irandom_range(150, 255));
	
	//create the player if does not exists
	if (!instance_exists(objPlayer) && death == 0) {
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
	planetDistance = (sprite_get_width(planet.sprite_index)/2) + planetSize + 16;
		
	yCreate -= planetDistance;
}


// Camera

var xShake = 0;
var yShake = 0;
if (timeShakeScreen != 0) {
	timeShakeScreen = Approach(timeShakeScreen, 0, 1);
	xShake = random_range(-1, 1);
	yShake = random_range(-1, 1);
}

if (instance_exists(objPlayer)) {
	var yPlayer = objPlayer.y;
	if (yPlayer < yCameraLimit) {
		yCameraLimit = yPlayer;
	}	
}

yCamera += ((yCameraLimit-(camera_get_view_height(view_camera[0])/2))-yCamera)*.1;

camera_set_view_pos(
	view_camera[0],
	xShake,
	yCamera + yShake
);

// create UFO
if (instance_exists(objPlayer)) {
	if (objPlayer.y < (-room_height*3) && !instance_exists(objUfo)) {
		instance_create_layer(
			room_width/2, 
			camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32,
			"Instances",
			objUfo
		);
	}	
}

// game over

if (death) {
	if (keyboard_check_pressed(vk_end) || keyboard_check_pressed(vk_enter)) {
		
		if (gameScore > gameScoreRecord) {
			gameScoreRecord = gameScore;
			ini_open(working_directory + "record.ini");
			ini_write_real("records", "planetsRecord", gameScoreRecord);
			ini_close();
		}
		
		if (galaxies > galaxiesRecord) {
			galaxiesRecord = galaxies;
			ini_open(working_directory + "record.ini");
			ini_write_real("records", "galaxiesRecord", galaxiesRecord);
			ini_close();
		}
		
		randomize();

		xCreate = irandom_range(0, room_width);
		yCreate = room_height - 48;

		planetSprite = choose(sprPlanet32, sprPlanet48, sprPlanet64);
		planetSize = sprite_get_width(planetSprite)/2;
		planetDistance = 0;

		yCameraLimit = yCreate;
		yCamera = yCameraLimit;
		
		maxScore = 0;
		gameScore = 0;
		galaxies = 0;
		
		death = 0;
		
		if (instance_exists(objPlayer)) {
			instance_destroy(objPlayer);
		}
		
		if (instance_exists(objUfo)) {
			instance_destroy(objUfo);
		}
		
		if (instance_exists(objPlanet)) {
			instance_destroy(objPlanet);
		}
		
		if (instance_exists(objUfoBullet)) {
			instance_destroy(objUfoBullet);
		}
	}
}
