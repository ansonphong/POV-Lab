////////// POLAR COORDINATES : PARTICLE MATRICES CONFIG ////////////
// This is a general use configuration setup for rendering 2D polar coordinates equasions
// Available functions official : http://www.povray.org/documentation/3.7.0/r3_3.html#r3_3_1_5_4
// Available functions unofficial : http://www.f-lohmueller.de/pov_tut/calc/math_600e.htm

///// CONFIG /////
global_settings {max_trace_level 1}

///// INCLUDES /////
#include "../includes/functions.inc"

///// CAMERA /////
camera { 
	orthographic 		// Available options : perspective, orthographic
	right x * 1			// Aspect Ratio
	angle 90			// Lens
	location <0, 0, -4>
	direction <0, 0,  2.25>
	look_at <0,0,0>
}
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;					// Current Iteration 
#declare c = 1;					// Numer of times to circle
#declare n = pow( 2, 8 ); 		// Number of Particles
#declare Diameter = 3/100;		// Sphere Diameter

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	///// RADIUS /////	
	#declare radiusDemo = 2 + sin( theta * 8 + pi/2 )/2; // An Example equasion
	#declare Radius = radiusDemo;

	///// TRANSLATION /////
	#declare xTranslate = Radius;
	#declare yTranslate = 0;
	#declare zTranslate = 0;
	
	///// ROTATION /////
	#declare xRotate = 0;
	#declare yRotate = 0;
	#declare zRotate = thetaDegrees;

	///// PARTICLE /////
	sphere {
		0, Diameter
		translate < xTranslate,  yTranslate,  zTranslate >
		rotate < xRotate, yRotate, zRotate >
		texture{
			pigment{
				color <1,1,1>
			}
		}
		finish{
			ambient rgb <1,1,1>
		} 
	}
	
#end

