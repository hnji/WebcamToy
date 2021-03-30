//filter 9


// ovo san "popravila" al je MASU sporo i dalje

void f_rightmirror_setup() {
 size(1024, 768);
 cam = new Capture(this, width, height);
 prva = createImage(width/2, height, RGB);
 druga = createImage(width/2, height, RGB);
 treca = createImage(width/2, height, RGB);
 
 cam.start();
 
 ime_filtera = "Right Mirror";
}

void f_rightmirror_draw() {
 cam.loadPixels();
 prva.loadPixels();
 druga.loadPixels();
 treca.loadPixels();
 
 for (int i = 0; i < width/2; i++) {
   for (int j = 0; j < height; j++) {
     int loc = i + j*(width/2);
     int loc2 = i + j*width;
     
      druga.pixels[loc] = cam.pixels[i + j*width];
      prva.pixels[loc] = druga.pixels[width/2-1-i + j*(width/2)];
      treca.pixels[loc] = cam.pixels[loc2];
     
   }
 }

 prva.updatePixels();
 druga.updatePixels();
 treca.updatePixels();
 
 image(cam, 0, 0);
 image(treca, 0, 0);
 image(prva, width/2, 0);
}
