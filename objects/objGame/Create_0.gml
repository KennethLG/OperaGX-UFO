/// @description Insert description here
// You can write your code in this editor

// room config

rmSpeed = 60;
room_speed = rmSpeed;

randomize();

gameStarted = 0;

xCreate = irandom_range(64, room_width - 64);
yCreate = room_height - 48;

planetSprite = choose(sprPlanet32, sprPlanet48, sprPlanet64);
planetSize = sprite_get_width(planetSprite)/2;
planetDistance = 0;

yCameraLimit = yCreate;
yCamera = yCameraLimit;

planetsScore = 255;
maxScore = 0;

gameScore = 0;
galaxies = 0;

ini_open(working_directory + "record.ini");
gameScoreRecord = ini_read_real("records", "planetsRecord", 0);
galaxiesRecord = ini_read_real("records", "galaxiesRecord", 0);
ini_close()

timeShakeScreen = 0;

death = 0;
yLayout = 0;
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
	"What means UFO?",
	"Now you are dead and alive \n at the same time. \n is a Schrödinger's gift",
	"The Schrödinger's cat is near you",
	"YouDoNotHaveInternet.jpeg",
	"Nikola Tesla is proud of you",
	"Einstein neither had internet",
	"Descartes seeing \n how you exist but \n you don't think",
	"Newton is \n disappointed in you",
	"I just know \n that you don't know"
];

msg = 0;

depth = -10;