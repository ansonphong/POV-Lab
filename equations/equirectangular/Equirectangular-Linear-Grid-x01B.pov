////////// EQUIRECTANGULAR : CAMERA CONFIG ////////////
// This is a general use configuration setup for creating equirectangular renderings
// Which can be viewed in 360 panorama viewers and VR headsets
// Rendered image dimensions are 2:1 ratio, ie. 2048x1024

///// CONFIG /////
global_settings {
	max_trace_level 5
}

///// INCLUDES /////
#include "../../includes/functions.inc"

///// CAMERA /////
camera {
	spherical
	angle 360 180
	location < 0, 0, 0>
	look_at <0,-10,0>
}


fog {
    distance 50
    color rgb<0, 0, 0>
    turbulence 0
    turb_depth 0
}


#declare whiteTex = texture{
	pigment{
		color < 1,  1, 1 >
	}
}
	
#declare whiteFinish =  finish{
	ambient rgb < 1, 1, 1 >
}


///// DRAW GRID /////
#declare i = 0;						// Current Iteration
#declare ii = 0;						// Current Iteration
#declare n = 100; 					// Number of X, Y grid lines
#declare nn = 100; 					// Number of Z grid layers
#declare gridSize = 10;				// Space between grid lines

// X AXIS
#macro xAxisLine( yTranslate, zTranslate )
	cylinder {
		<-500, 0, 0.0>, <500, 0, 0.0>, 0.02
		no_shadow
		translate <0, yTranslate, zTranslate>	
		texture { whiteTex }
		finish { whiteFinish }
	}

#end

// Y AXIS
#macro yAxisLine( xTranslate, zTranslate )
	cylinder {
		<0, -500, 0.0>, <0, 500, 0.0>, 0.02
		no_shadow
		translate <xTranslate, 0, zTranslate>	
		texture { whiteTex }
		finish { whiteFinish }
	}
#end

#while( ii < nn )
	#local Zmodulation = (mod( ii, 2 ) - 0.5 ) * 2;
	#while( i < n )
		#local XYmodulation = (mod( i, 2 ) - 0.5 ) * 2;
		object{
			xAxisLine( ceil(i/2) * XYmodulation * gridSize - gridSize/2, ceil(ii/2) * Zmodulation * gridSize - gridSize/2 )
			translate<0,0, 0>
		}
		object{
			yAxisLine( ceil(i/2) * XYmodulation * gridSize - gridSize/2, ceil(ii/2) * Zmodulation * gridSize - gridSize/2 )
			translate<0,0, 0>
		}
		#declare i = i+1;
		//#debug concat("i =",str(    i   ,5,0),"\n")
	#end
	#declare i = 0;
	#declare ii = ii+1;
	//#debug concat("ii =",str(    ii   ,5,0),"\n")
#end


