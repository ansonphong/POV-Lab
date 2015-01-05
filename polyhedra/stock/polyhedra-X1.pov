////////// POLAR COORDINATES : PARTICLE MATRICES CONFIG ////////////
// This is a general use configuration setup for rendering 2D polar coordinates equations
// Available functions official : http://www.povray.org/documentation/3.7.0/r3_3.html#r3_3_1_5_4
// Available functions unofficial : http://www.f-lohmueller.de/pov_tut/calc/math_600e.htm

///// CONFIG /////
global_settings {max_trace_level 1}

///// INCLUDES /////
#include "../../includes/functions.inc"
#include "../../includes/shapes2.inc"

///// CAMERA /////
camera {
	perspective 		// Available options : perspective, orthographic
	right x * 1			// Aspect Ratio
	angle 30			// Lens
	location <0, 0, -15>
	direction <0, 0,  2.25>
	look_at <0,0,0>
}


/*
	sphere {
		0, 3
		translate < 0,  0,  0 >
		rotate < 0, 0, 0 >
		texture{
			pigment{
				color <1,1,1>
			}
		}
		finish{
			ambient rgb <.1,.1,.1>
		}
	}
*/
	
union{
	object{
		Tetrahedron  //Dodecahedron	
	}
	object{
		Tetrahedron  //Dodecahedron
		rotate<0,60,180>
	}
	rotate<-20,0,0>
	texture{ pigment{ rgbf<1,1,1,1> filter 0 transmit 0 } }
	finish{ ambient rgb <.1,.1,.1> }	
}



light_source {
	< -100, 200, -500>
	rgb <1.000000, 1.000000, 1.000000> * 1.0
	shadowless
}




light_source {
	< 100, -100, -400>
	rgb < .6, .8, 1 > * 2.0
}
