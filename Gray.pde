// filter 3



// Size of each cell in the grid
int videoScale_gray = 5;
// Number of columns and rows in the system
int cols_gray, rows_gray;
// Variable for capture device
//Capture video;

void f_gray_setup() { 
  //size(640, 480);  
  // Initialize columns and rows  
  cols_gray = width/videoScale_gray;  
  rows_gray = height/videoScale_gray;  
  // Construct the Capture object  
  cam = new Capture(this, cols_gray, rows_gray);  
  cam.start();
  
  ime_filtera = "Gray";
}

//void captureEvent(Capture video) {  
//  video.read();
//}

void f_gray_draw() {  
  
  cam.loadPixels();  
  image(cam, 0, 0);
  background(0);
  // Begin loop for columns  
  for (int i = 0; i < cols_gray; i++) {    
    // Begin loop for rows    
    for (int j = 0; j < rows_gray; j++) {      
      // Where are you, pixel-wise?      
      int x = i * videoScale_gray;      
      int y = j * videoScale_gray;      
      
      // Reverse the column to mirro the image.
      int loc = i + j * cam.width;       
      
      // INDEKS ISKACE
      color c = cam.pixels[loc];
      // A rectangle's size is calculated as a function of the pixel’s brightness. 
      // A bright pixel is a large rectangle, and a dark pixel is a small one.
      float sz = (brightness(c)/255) * videoScale_gray;       
      
      rectMode(CENTER);      
      fill(255);      
      noStroke();      
      rect(x + videoScale_gray/2, y + videoScale_gray/2, sz, sz);       
  }
}  

}
