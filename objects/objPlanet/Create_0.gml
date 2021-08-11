/// @description Insert description here
// You can write your code in this editor

//hue = irandom_range(220, 255);
//color = make_color_hsv(hue, 220, 220);

angle = irandom(360);

alphaStart = random_range(.5, 1);
alphaEnd = random_range(.5, 1);
alphaVel = random_range(.01, .001);
alphaTo = alphaEnd;
alpha = alphaStart;

create = 1;

death = 0;
circleAlpha = 0;
circleRadius = 0;

detailsAlpha = 1;
details = [];
rings = [];