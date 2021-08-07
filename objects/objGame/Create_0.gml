/// @description Insert description here
// You can write your code in this editor

// room config
room_speed = 60;


yCreate = room_height - 48;

canCreate = 1;

planetSprite = choose(sprPlanet32, sprPlanet48, sprPlanet64);
planetSize = sprite_get_width(planetSprite)/2;
planetDistance = 0;

instance_create_layer(room_width/2, room_height, "Instances", objPlayer);