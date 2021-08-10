/// @description Insert description here
// You can write your code in this editor

// room config
rmSpeed = 60;
room_speed = rmSpeed;

yCreate = room_height - 48;

randomize();

planetSprite = choose(sprPlanet32, sprPlanet48, sprPlanet64);
planetSize = sprite_get_width(planetSprite)/2;
planetDistance = 0;

yCameraLimit = yCreate;
yCamera = yCameraLimit;

maxScore = 0;
gameScore = 0;

timeShakeScreen = 0;

death = 0;
yLayout = 0;
alphaLayout = 0;
messages = [
	"The router is connected?",
	"Again we forgot \n to pay the internet :( ",
	"There is better\n signal in NGC 2392",
	"Let's go to \n Cat's eye nebula!",
	"The phantom Opera GX \n is arrived",
	"I have a friend on \n Kepler-1b who \n also has no internet",
	"Perhaps quantum \n physics will help us \n go further",
	"The internet is relative",
	"Remember that \n the shortest distance \n between two points is \n a straight line",
	"What means UFO?"
]

msg = 0;

depth = -10;