// filter 2



// Size of each cell in the grid, ratio of window size to video size
int videoScale = 3;
// Number of columns and rows in the system
int cols_m2, rows_m2;
// Variable to hold onto Capture object
//Capture video;

void f_mirror2_setup() {  
  //size(640, 480);  
  // Initialize columns and rows  
  cols_m2 = 1024/videoScale;  
  rows_m2 = 768/videoScale;  
  //background(0);
  
  //
  cam = new Capture(this, cols_m2, rows_m2);
  cam.start();
  ime_filtera = "Mirror 2";
}

// Read image from the camera
//void captureEvent(Capture video) {  
// video.read();
//}

void f_mirror2_draw() {
  cam.loadPixels();  
  image(cam, 0, 0);
  // Begin loop for columns  
  for (int i = 0; i < cols_m2; i++) {    
    // Begin loop for rows    
    for (int j = 0; j < rows_m2; j++) {      
      // Where are you, pixel-wise?      
      int x = i*videoScale;      
      int y = j*videoScale;
      color c = cam.pixels[i + j*cam.width];
      fill(c);   
      stroke(0);      
      rect(x, y, videoScale, videoScale);    
    }  
  }
}
