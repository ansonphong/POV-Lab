////////// POLAR COORDINATES : PARTICLE MATRICES CONFIG ////////////
// This is a general use configuration setup for rendering 2D polar coordinates equations
// Available functions official : http://www.povray.org/documentation/3.7.0/r3_3.html#r3_3_1_5_4
// Available functions unofficial : http://www.f-lohmueller.de/pov_tut/calc/math_600e.htm

///// CONFIG /////
global_settings {max_trace_level 1}

///// INCLUDES /////
#include "../../includes/functions.inc"

///// CAMERA /////
camera {
	orthographic 		// Available options : perspective, orthographic
	right x * 1			// Aspect Ratio
	angle 90			// Lens
	location <0, 0, -14>
	direction <0, 0,  2.25>
	look_at <0,0,0>
}

///// GLOBAL VARS /////
#declare cc = 3;

#declare globalR = pi/2;
#declare globalP = 6;

//////////////////// LOTUS MATRIX ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1;							// Numer of times to circle
#declare n = pow( 2, 14 ); 				// Number of Particles
#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = 1.5/100; //(150 - 50 * sin(theta*4 - pi/2));				// Sphere Diameter


	///// LOTUS /////
	// This is a basic equasion for rendering lotus patterns
	#declare li = 	1.5;		// Initial Radius
	#declare lp = 	globalP; 		// Petals
	#declare lm = 	1;		// Multiplier
	#declare lo = 	2;		// In/Out Curve Ratio
	#declare lc = 	16;		// Curvature
	#declare lg = 	3; 		// Inward Gravity
	#declare lr = 	-pi/2 + globalR;		// Rotation
	#declare Lotus = li +lm*(((abs(cos(theta*(lp/2)+lr/2))*lo)-(abs(cos(theta*(lp/2)+pi/2+lr/2)))*lg)/(2+abs(cos(theta*(lp/2)*2+pi/2+lr))*lc));

	
	///// RADIUS /////
	// TODO : Create a model whereby the radius jumps up by floor method, number of particles / number of circles
	// To create a more consistant lack of jump at the first level
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	#declare shape1 =  0 + Lotus * sin( theta* pow( 2, 9 ) + pi ) * abs( sin( theta* globalP/2 + globalR ) );
	#declare Radius = 0 + shape1 ;

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




//////////////////// LOTUS MATRIX ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1;							// Numer of times to circle
#declare n = pow( 2, 14 ); 				// Number of Particles
#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = 1.5/100; //(150 - 50 * sin(theta*4 - pi/2));				// Sphere Diameter


	///// LOTUS /////
	// This is a basic equasion for rendering lotus patterns
	#declare li = 	2;		// Initial Radius
	#declare lp = 	globalP; 		// Petals
	#declare lm = 	1;		// Multiplier
	#declare lo = 	2;		// In/Out Curve Ratio
	#declare lc = 	2;		// Curvature
	#declare lg = 	3; 		// Inward Gravity
	#declare lr = 	0 + globalR * 2;		// Rotation
	#declare Lotus = li +lm*(((abs(cos(theta*(lp/2)+lr/2))*lo)-(abs(cos(theta*(lp/2)+pi/2+lr/2)))*lg)/(2+abs(cos(theta*(lp/2)*2+pi/2+lr))*lc));

	
	///// RADIUS /////
	// TODO : Create a model whereby the radius jumps up by floor method, number of particles / number of circles
	// To create a more consistant lack of jump at the first level
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	#declare shape1 =  cc + Lotus + sin( theta* pow( 2, 9 ) + pi/2 + globalR*2 ) * abs( sin( theta* globalP/2 + globalR ) );
	#declare Radius = 0 + shape1 ;

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









//////////////////// LOTUS MATRIX ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1;							// Numer of times to circle
#declare n = pow( 2, 14 ); 				// Number of Particles
#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = 1.5/100; //(150 - 50 * sin(theta*4 - pi/2));				// Sphere Diameter


	///// LOTUS /////
	// This is a basic equasion for rendering lotus patterns
	#declare li = 	2.5;		// Initial Radius
	#declare lp = 	globalP; 		// Petals
	#declare lm = 	1;		// Multiplier
	#declare lo = 	2;		// In/Out Curve Ratio
	#declare lc = 	1;		// Curvature
	#declare lg = 	3; 		// Inward Gravity
	#declare lr = 	pi + globalR*2;		// Rotation
	#declare Lotus = li +lm*(((abs(cos(theta*(lp/2)+lr/2))*lo)-(abs(cos(theta*(lp/2)+pi/2+lr/2)))*lg)/(2+abs(cos(theta*(lp/2)*2+pi/2+lr))*lc));

	
	///// RADIUS /////
	// TODO : Create a model whereby the radius jumps up by floor method, number of particles / number of circles
	// To create a more consistant lack of jump at the first level
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	#declare shape1 =  6 + Lotus + sin( theta* pow( 2, 9 ) + pi + globalR ) * abs( sin( theta* globalP/2 ) );
	#declare Radius = 0 + shape1 ;

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






//////////////////// LOTUS MATRIX ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1;							// Numer of times to circle
#declare n = pow( 2, 14 ); 				// Number of Particles
#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = 1.5/100; //(150 - 50 * sin(theta*4 - pi/2));				// Sphere Diameter


	///// LOTUS /////
	// This is a basic equasion for rendering lotus patterns
	#declare li = 	2;		// Initial Radius
	#declare lp = 	globalP; 		// Petals
	#declare lm = 	1;		// Multiplier
	#declare lo = 	2;		// In/Out Curve Ratio
	#declare lc = 	2;		// Curvature
	#declare lg = 	3; 		// Inward Gravity
	#declare lr = 	0 + globalR * 2;		// Rotation
	#declare Lotus = li +lm*(((abs(cos(theta*(lp/2)+lr/2))*lo)-(abs(cos(theta*(lp/2)+pi/2+lr/2)))*lg)/(2+abs(cos(theta*(lp/2)*2+pi/2+lr))*lc));

	
	///// RADIUS /////
	// TODO : Create a model whereby the radius jumps up by floor method, number of particles / number of circles
	// To create a more consistant lack of jump at the first level
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	#declare shape1 =  10 + Lotus + sin( theta* pow( 2, 9 ) + pi/2 + globalR*2 ) * abs( sin( theta* globalP/2 + globalR ) );
	#declare Radius = 0 + shape1 ;

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




/*
//////////////////// POLYGON ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;					// Current Iteration
#declare c = pow( 2, 3 );		// Numer of times to circle
#declare n = pow( 2, 12 ); 		// Number of Particles

#declare Diameter = 2/100;		// Sphere Diameter

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );

	///// POLYGON /////
	// This is a basic equasion for rendering 3-12 sided polygons
	#declare polyS = 3; 				// Polygon Sides
	#declare polyR = ( pi / 2 );			// Polygon Rotation
	#declare Polygon = ( cos( pi / polyS )  /  cos(  mod(  max( theta + polyR , polyR ) ,  max( 2 * pi / polyS, polyR )   )  - pi / polyS ) ) ;

	///// RADIUS /////
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	#declare Radius = Polygon * cc * pulse;

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

*/

/*
//////////////////// CIRCLE / POLYGON FILL ////////////////////
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;					// Current Iteration
#declare c = pow( 2, 3 );		// Numer of times to circle
#declare n = pow( 2, 9 ); 		// Number of Particles

#declare Diameter = 1/100;		// Sphere Diameter

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );

	///// POLYGON /////
	// This is a basic equasion for rendering 3-12 sided polygons
	#declare polyS = 3; 				// Polygon Sides
	#declare polyR = ( pi / 2 );			// Polygon Rotation
	#declare Polygon = ( cos( pi / polyS )  /  cos(  mod(  max( theta + polyR , polyR ) ,  max( 2 * pi / polyS, polyR )   )  - pi / polyS ) ) ;

	///// RADIUS /////
	#declare pulse = floor( seq * c - 0.0000001) / c;
	#declare frame = sin( pulse * pi );
	
	#declare Radius = Polygon * cc + ( cc - Polygon*cc ) * pulse;// Polygon * cc * pulse;

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

*/