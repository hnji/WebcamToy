// filter 1

// Size of each cell in the grid
//int cellSize = 10;
//// Number of columns and rows in our system
//int cols, rows;


//void f_mirror_setup() {
 
//  //frameRate(30);
//  cols = width / cellSize;
//  rows = height / cellSize;
//  //println("width = " + width + ", height = " + height + ", cols = " + cols + ", rows = " + rows);
//  cam = new Capture(this, width, height);
//  cam.start();
//  colorMode(RGB, 255, 255, 255, 100);
//  background(0);
  
//  ime_filtera = "Mirror";

//}


//void f_mirror_draw() { 
//  if (cam.available()) {
 
//    cam.loadPixels();
  
//    //frameRate(30);
//    //colorMode(RGB, 255, 255, 255, 100);

  
//    // Begin loop for columns
//    for (int i = 0; i < cols; i++) {
//      // Begin loop for rows
//      for (int j = 0; j < rows; j++) {
      
//        // Where are we, pixel-wise?
//        int x = i*cellSize;
//        int y = j*cellSize;
//        int loc = (cam.width - x - 1) + y*cam.width; // Reversing x to mirror the image
//        //println("loc = " + loc);
        
        
//        //ISKACE INDEKS
//        //println("cam.pixels = " + cam.pixels[(1024 - x - 1) + y*768]);
//        float r = red(cam.pixels[loc]);
//        //println("r = " + r);
//        float g = green(cam.pixels[loc]);
//        //println("g = " + g);
//        float b = blue(cam.pixels[loc]);
//        // Make a new color with an alpha component
//        color c = color(r, g, b, 75);
      
//        // Code for drawing a single rect
//        // Using translate in order for rotation to work properly
//        pushMatrix();
//        translate(x+cellSize/2, y+cellSize/2);
//        // Rotation formula based on brightness
//        rotate((2 * PI * brightness(c) / 255.0));
//        rectMode(CENTER);
//        fill(c);
//        noStroke();
//        // Rects are larger than the cell for some overlap
//        rect(0, 0, cellSize+6, cellSize+6);
//        popMatrix();
//      }
//    }
//  }
//}
