//filter 11 

void f_bottom_mirror_setup() {
 cam = new Capture(this, width, height);
 prva = createImage(width, height/2, RGB);
 druga = createImage(width, height/2, RGB);
 treca = createImage(width, height/2, RGB);
 
 cam.start();
 
 ime_filtera = "Bottom Mirror";
  
}

void f_bottom_mirror_draw() {
 cam.loadPixels();
 prva.loadPixels();
 druga.loadPixels();
 treca.loadPixels();
 
  for (int i = 0; i < polaPiksela; i++){
    prva.pixels[i] = cam.pixels[ukupnoPiksela-1-i];
    treca.pixels[i] = cam.pixels[i + polaPiksela -1];
  }
 
 for (int i = 0; i < width; i++) {
   for (int j = 0; j < height/2; j++) {
     int loc = i + j*width;
     druga.pixels[loc] = prva.pixels[width-1-i + j*width];
     //treca.pixels[loc] = cam.pixels[loc + polaPiksela -1];
   }
 }
 
 prva.updatePixels();
 druga.updatePixels();
 treca.updatePixels();
 
 image(cam, 0, 0);
 image(treca, 0, height/2);
 image(druga, 0, 0);
}
