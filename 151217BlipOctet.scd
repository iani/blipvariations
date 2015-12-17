//:
{ | n |
	var name;
	name = format("multi%", n).asSymbol;
	n = n % 4;
	{
		Blip.arps(
			1 + n / 2 * Line.kr(Rand(20, 80).midicps, Rand(20, 80).midicps, Rand(0.1, 1)),
			Line.kr(Rand(5, 25), Rand(5, 25), 0.5)
		).perform([\perc, \sine]@@n)
	} +> name;

	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;

//:
{ | n |
	var name;
	name = format("multi%", n).asSymbol;
	n = n % 4;
	{
		var src;
		src = Blip.arp(
			1 + n / 2 * Line.kr(Rand(20, 80).midicps, Rand(20, 80).midicps, Rand(0.1, 1)),
			Line.kr(Rand(5, 25), Rand(5, 25), 0.5)
		).perform([\perc, \sine]@@n);
		Out.ar (Rand (22), src);
	} +> name;

	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;

//:
/*

*/
var base;
base = nil.asTarget;
{
	ReplaceOut.ar (0,
		[
			In.ar (0), // 1
			In.ar (1), // 2
			In.ar (2), // 3
			In.ar (3), // 4
			In.ar (4), // 5
			In.ar (5), // 6
			In.ar (6), // 7
			In.ar (7), // 8
			Silent.ar (), // 9
			Silent.ar (),  // 10
			Silent.ar (),
			Silent.ar (),			
			In.ar (8), // 9
			In.ar (9), // 10
			In.ar (10), // 11
			In.ar (11), // 12
			In.ar (12), // 13
			In.ar (13), // 14
			In.ar (14), // 15
			Silent.ar (),
			In.ar (15), // 16
			In.ar (16), // 17
			In.ar (17), // 18
			In.ar (18), // 19
			In.ar (19), // 20
			In.ar (20) // 21
			In.ar (21) // 22
		]
	)
}.play (base)
//: Ah stereo
{ | i | 
	[-1.0, 1.0].pwhite +>.pos format("multi%", i).asSymbol;
} ! 8;
//: Variation 0:

\multi0 **>.xoooo \multi0;
\multi1 **>.xoooo \multi1;
\multi2 **>.xoooo \multi2;
\multi3 **>.x \multi3;
\multi4 **>.xoooo \multi4;
\multi5 **>.xoooo \multi5;
\multi6 **>.xoooo \multi6;
\multi7 **>.xoooo \multi7;

//: Variation 1:

\multi0 **>.xoooo \multi0;
\multi1 **>.o \multi1;
\multi2 **>.o \multi2;
\multi3 **>.x \multi3;
\multi4 **>.o \multi4;
\multi5 **>.o \multi5;
\multi6 **>.o \multi6;
\multi7 **>.xo \multi7;

//: Variation 2:

\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
\multi3 **>>.xo \___multi7;
\multi2 **>>.xo \____multi7;
\multi1 **>>.xo \_____multi7;
\multi0 **>>.xo \______multi7;

//: Variation 3:

\multi7 *> 0.1;

//: Variation 4:

([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
{ | n | Pfunc({ 0.01 exprand: 0.35 }) +>.amp format("multi%", n).asSymbol } ! 8;

//: Variation 5:

([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3]).flat.prand *> \multi3;
\multi3 **>.xoo \multi3;
\multi2 **>>.xoo \_multi3;
\multi1 **>>.xoo \__multi3;
\multi0 **>>.xoo \___multi3;
//:
TaskPlayer.stopAll;
//:
0.01 *> \multi0;
//:
0.1 *> \multi1;
//:
\multi2 **>>.xo \multi1;
0.5 +>.amp \multi2;
//:
\multi3 **>>.xo \_multi1;
//:
\multi0.stop;
\multi1.stop;