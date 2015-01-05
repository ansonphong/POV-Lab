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
	perspective 		// Available options : perspective, orthographic
	right x * 1			// Aspect Ratio
	angle 60			// Lens
	location <5, 0, -20>
	direction <0, 0,  2.25>
	look_at <0,0,0>
}


////////// POLAR COORDS : CONFIG //////////
#declare i = 0;				// Current Iteration
#declare n = pow( 6, 4 ); 			// Number of Iterations


#declare getVectorX = function( ii, iii ){
	sin( ii * pi * (1/6) * 2  ) * 6  * cos( iii/n * pi * 6 + pi/2 )
}

#declare getVectorY = function( ii, iii ){
	cos( ii * pi * (1/6) * 2  ) * 6 * sin( iii/n * pi * 6 )
}

#declare getVectorZ = function( ii, iii ){
	cos( ii * pi * (1/6) * 2  ) * 6
}

#macro equalateralArray( i )
	#local segments = 6;
	#local segmentLength = n / segments;
	
	#local iPrev = floor( i / segmentLength );
	#local iNext = ceil( i / segmentLength );
	
	#local prevX = getVectorX( iPrev, i );
	#local nextX = getVectorX( iNext, i );
	
	#local prevY = getVectorY( iPrev, i );
	#local nextY = getVectorY( iNext, i );
	
	#local prevZ = getVectorZ( iPrev, i );
	#local nextZ = getVectorZ( iNext, i );

	#local segmentDecimal = ( i - ( iPrev * segmentLength ) ) / segmentLength; // (decimal [ 0-1 ] )
	
	#local X = prevX + ( nextX - prevX ) * segmentDecimal;
	#local Y = prevY + ( nextY - prevY ) * segmentDecimal;
	#local Z = prevZ + ( nextZ - prevZ ) * segmentDecimal;

	///// PARTICLE /////
	sphere {
		0,
		0.15
		translate < X,  Y,  Z >
		rotate < 0, 0, 0 >
		texture{
			pigment{
				color < 1,1,1 >
			}
		}
		finish{
			ambient rgb <1,1,1>
		}
	}

#end

#while( i < n )
	object{
		equalateralArray( i )
	}
	#declare i = i+1;
#end








/*
////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1; //pow( 2, 1 );				// Numer of times to circle
#declare n = pow( 2, 6 ); 				// Number of Particles

#declare radia = function( X ){ 3 };
#declare triColor = function( X ){ 1 };

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = .1;				// Sphere Diameter
	
	///// RADIUS /////
	// TODO : Create a model whereby the radius jumps up by floor method, number of particles / number of circles
	// To create a more consistant lack of jump at the first level
	#declare pulse = ceil( seq * c ) / c;
	#declare shapes = 2 + sin( theta * 4 + pi/2 ) * 2 * sin( theta * 2 ) + round( theta / 20 )/(pi/2) + round( sin( theta * 64 + pi/2 ) ) / 2;
	
	#declare rad = radia( i ) ;
	
	#declare Radius = rad;

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



