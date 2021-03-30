
int brojFiltera = 22;

// setupovi za sve filtere
void filteri_setup(int status) {
  switch (status) {
   case 0:
     cam = new Capture(this, width, height);
     cam.start();
     ime_filtera = "No filter";
     break;
     
   case 1:
     f_sobel_setup();
     break;
     
   case 2:
     f_mirror2_setup();
     break;
     
   case 3:
     f_gray_setup();
     break;
    
    case 4:
      f_blackwhite_setup();
      break;
      
    case 5:
     f_gray2_setup();
     break;
     
   case 6:
     f_switchRG_setup();
     break;
       
   case 7:
     f_leftmirror_setup();
     break;
       
   case 8:
     f_upside_down_setup();
     break;    
       
   case 9:
     f_rightmirror_setup();
     break;
     
   case 10:
     f_topMirror_setup();
     break;

   case 11:
     f_bottom_mirror_setup();
     break;
     
   case 12:
     f_quadcam_setup();
     break;
     
   case 13:
     f_quadmirror_setup();
     break;
     
   case 14:
     f_switch_setup();
     break;
     
   case 15:
     f_inverse_setup();
     break;
     
   case 16:
     f_pastelstripes_setup();
     break;
     
    case 17:
     f_pastelcircles_setup();
     break;
     
   case 18:
     f_contrast_setup();
     break;
   
   case 19:
     f_red_tint_setup();
     break;
   
   case 20:
     f_green_tint_setup();
     break;
     
   case 21:
     f_blue_tint_setup();
     break;

  }
}


// u draw pozovi fju za odgovarajuci filter
void filteri_draw(int status) {
  
  switch (status) {
    case 0: 
      image(cam, 0, 0, WindowWidth, WindowHeight);
      break;
      
    case 1:
     f_sobel_draw();
      break;
      
    case 2:
      f_mirror2_draw();
      break;
      
    case 3:
      f_gray_draw();
      break;
      
    case 4:
      f_blackwhite_draw();
      break;
      
    case 5:
      f_gray2_draw();
      break;
      
    case 6:
       f_switchRG_draw();
       break;
    
    case 7:
       f_leftmirror_draw();
       break;
       
    case 8:
       f_upside_down_draw();
       break;
       
    case 9:
     f_rightmirror_draw();
     break;
     
   case 10:
     f_topMirror_draw();
     break;
     
   case 11:
     f_bottom_mirror_draw();
     break;
     
   case 12:
     f_quadcam_draw();
     break;
     
   case 13:
     f_quadmirror_draw();
     break;
     
   case 14:
     f_switch_draw();
     break;
     
   case 15:
     f_inverse_draw();
     break;
     
   case 16:
     f_pastelstripes_draw();
     break;
  
  case 17:
     f_pastelcircles_draw();
     break;
 
  case 18:
     f_contrast_draw();
     break;
  
  case 19:
     f_red_tint_draw();
     break;
     
  case 20:
     f_green_tint_draw();
     break;
  
  case 21:
     f_blue_tint_draw();
     break;
  }
}
