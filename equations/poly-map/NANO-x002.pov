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


//////////////////// GLOBALS ////////////////////
#declare coreScale = 3;

//////////////////// HARMONIC ARRAY ////////////////////
// SINGLE TRIANGLE

#declare ml = 2;	// Multiplier
// 1 ~ 1.5			1 + ( 1/2 )
// 2 ~ 1.2			1 + ( 1/5 )
// 3 ~ 1.125		1 + ( 1/8 )
// 4 ~ 1.090909 	1 + ( 1/11 )

#declare h = 12 * 6 * ml;			// Haromonic
#declare c = 6 * ml;					// Circles

#declare i = 0;						// Current Iteration
#declare n = h * 100; 				// Number of Iterations

#macro pulseB( ii )
	#local levels = h;
	#local pX = 2; 	// 2
	#local pulse = floor( abs( sin( sin( ii / n * pi * h * 2 * pX )  * pi / 2 ) ) * levels ) / levels;
	pulse
#end

#macro weaveA( si, ii, seg )
	#local circle = floor( ( max(ii,1) / n ) * c - 0.0000001) - 1 ;
	#local weave = 1;
	weave
#end

///// OFFSET : SEQUENCE /////
#macro oSeq( ii )
	#local s = 6; 		// Sides
	#local seq = ii/n;
	floor( seq * s ) / s * pi * 2

#end

///// OFFSET : X /////
#macro offsetX( si, ii, seg )
	#local o = cos( oSeq( ii ) ) * 3;
	o
#end

///// OFFSET : Y /////
#macro offsetY( si, ii, seg )
	#local o = sin( oSeq( ii ) ) * 3;
	o
#end

///// X /////
#macro getVectorX( si, ii, seg )
	#local X = ( sin( si * pi * ( 2 / seg ) * c*2 + pi ) * coreScale );
	#local X = offsetX( si, ii, seg ) + X * weaveA( si, ii, seg );// * pulseB( ii );
	X
#end

///// Y /////
#macro getVectorY( si, ii, seg )
	#local Y = ( cos( si * pi * ( 2 / seg ) * c*2 + pi ) * coreScale );
	#local Y = offsetY( si, ii, seg ) + Y * weaveA( si, ii, seg );// * pulseB( ii );
	Y
#end

///// Z /////
#macro getVectorZ( si, ii, seg )
	0
#end

#macro equalateralArray( i )
	#local segments = h;
	#local segmentLength = n / segments;
	
	#local iPrev = floor( i / segmentLength );
	#local iNext = ceil( i / segmentLength );
	
	#local prevX = getVectorX( iPrev, i, segments );
	#local nextX = getVectorX( iNext, i, segments );
	
	#local prevY = getVectorY( iPrev, i, segments );
	#local nextY = getVectorY( iNext, i, segments );
	
	#local prevZ = getVectorZ( iNext, i, segments );
	#local nextZ = getVectorZ( iNext, i, segments );

	#local segmentDecimal = ( i - ( iPrev * segmentLength ) ) / segmentLength; // (decimal [ 0-1 ] )
	
	#local X = ( prevX + ( nextX - prevX ) * segmentDecimal ) ;
	#local Y = ( prevY + ( nextY - prevY ) * segmentDecimal ) ;
	#local Z = prevZ + ( nextZ - prevZ ) * segmentDecimal ;

	#local sphereSize = 0.05;

	#local Zrot = 0; //cos( i/n * pi * pow( 7, 4 ) ) * 360/(segments*4);
	
	#local colorR = 1;
	#local colorG = 1;
	#local colorB = 1;

	///// PARTICLE /////
	sphere {
		0,
		sphereSize
		translate < X,  Y,  Z >
		rotate < 0, 0, Zrot >
		texture{
			pigment{
				color < colorR,  colorG, colorB >
			}
		}
		finish{
			ambient rgb < colorR, colorG, colorB >
		}
	}

#end

#while( i < n )
	object{
		equalateralArray( i )
	}
	#declare i = i+1;
#end




////////// POLAR COORDS : CONFIG //////////
#declare i = 0;							// Current Iteration
#declare c = 1; 							// Numer of times to circle
#declare n = pow( 3, 5 ); 				// Number of Particles

#declare radia = function( X ){ 12 };
#declare triColor = function( X ){ 1 };

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	#declare thetaDegrees = theta * (180/pi);
	#declare seq = ( i / n );
	
	#declare Diameter = .03;				// Sphere Diameter
	
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




