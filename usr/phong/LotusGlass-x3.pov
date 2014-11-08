#include "../../includes/functions.inc"
global_settings {max_trace_level 1}

camera { 
	//perspective
	orthographic
	angle 90
	location <0, 0, -1.5>
	//location <0, 0, -3.5>
	direction <0, 0,  2.25>
	look_at <0,0,0>
	right x * 1
}

////////// SPIRAL PATTERN //////////
#declare i = 1;				// Current Iteration 
#declare m = 1024*4;		// Multiplier
#declare c = 2;				// Numer of times to circle
#declare n = 10 * m; 		// Number of Iterations
#declare d = .33;			// Sphere Diameter

#while( i < n )
	#declare i = i+1;
	#declare theta = ( i / n ) * c * pi * 2;
	
	///// POLYGON /////
	#declare pSA = 3; 		// Polygon sides
	
	#declare modRA = floor( cos( i ) ) * 2 + 3 ;	 				// Modulate Rotation
	#declare pRA = (pi / 2) / modRA + cos( i / pi )/4;			// Polygon Rotation
	
	#declare pGonA = ( cos( pi / pSA )  /  cos(  mod(  max( theta + pRA , pRA ) ,  max( 2 * pi / pSA, pRA )   )  - pi / pSA ) )  ;
	
	
	///// LOTUS EQUASION /////
	#declare p = 4; 			// Number of lotus petals
	#declare lotusEq = (  ( (abs(cos(theta*p)))-((abs(cos(theta*p+pi/2))))*1) / ( 2+abs(cos(theta*p*2+pi/2))*8 )  );
	
	
	// SEQUENCE : percentage of the way to the end, in decimal : 0-1
	#declare s = ( i / n ); 	
	
	#declare f = s * pi * 2;
	
	///// PROPERTIES /////
	#declare strobe = sin( f *  p * pow( 2, 9 ) + pi / 2 );			//floor( sin( ( (i / n)*4 )  ) * 4 ) / 2 + sin(i)/4; 
		
	#declare xA = 0; 			// pGonA;		//+ strobe - .25; 
	#declare xB = strobe; 		//lotusEq ;		//( 2 + ( lotusEq * s ) ) ; 		//  *  ( pow( pow( s , 1) , .5)  ) 
	#declare xC = lotusEq;		 //pGonA; 		//stroke * 4 ; 	// * s;

	#declare d = (.4 - abs( lotusEq ))*2; 			// + lotusEq/2; 			//* pGonA; 	//.8-stroke/12 ;

	///// TRANSLATION /////
	#declare xTranslate = xA + xB + xC ;
	#declare yTranslate = 0; //stroke*2;
	#declare zTranslate = xC * -1;

	///// ROTATION /////
	#declare rExp1 = 0; 
	#declare thetaDegrees = theta * (180/pi);
	#declare xRotate = 0;
	#declare yRotate = 0;
	#declare zRotate = thetaDegrees + rExp1;

	sphere {
		0, d/100
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
