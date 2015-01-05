//#include "../../includes/functions.inc"
     
background { color rgb<1,1,1> }

global_settings { assumed_gamma 1.0}

camera
  {
  location <0, 0, -25>
  right <1,0,0> up <0,1,0>
  look_at  <0, 0, 0>
  angle 5
  }


light_source
  {
  <0, 20, -50>
  color rgb<1,1,1>
  area_light <5, 0, 0>, <0, 5, 0>, 1, 1  /* very slow, decrease 10 to 2 for experiments */
  adaptive 3
  }


#declare r_tube = 0.075;  // thickness (radius) of tube
#declare num_steps = 36;  // number of spline points
#declare step_size = 1/num_steps;

sphere_sweep
  {
  cubic_spline num_steps+3,
  #declare N = -1;
  #while(N <= num_steps + 1)
    #declare theta = 2 * pi * N * step_size;
    <0.3*( 2*sin(2*theta)-sin(theta) ), 0.3*( 2*cos(2*theta)+cos(theta) ), 0.3*sin(3*theta)>, r_tube
    /* uses a hypotrochoid */
    #declare N = N + 1;
  #end
  pigment { color rgb <0,0.25,1> }
  finish          
    {
    ambient 0.15
    diffuse 0.85
    brilliance 2
    //phong 1
    //phong_size 1
    }
  }
  
 
 /*               
plane
  {
  <0,0,-1>, -0.375
  pigment { color rgb<1,1,1> }
  finish
    {
    ambient 0.35
    diffuse 0.65
    }
  }
  */