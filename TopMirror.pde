// filter 10

//maknula crtu


void f_topMirror_setup() {
 cam = new Capture(this, width, height);
 prva = createImage(width, height/2, RGB);
 druga = createImage(width, height/2, RGB);
 treca = createImage(width, height/2, RGB);
 
 cam.start();
  
 ime_filtera = "Top Mirror";
}

void f_topMirror_draw() {
 cam.loadPixels();
 prva.loadPixels();
 druga.loadPixels();
 treca.loadPixels();
 
  for (int i = 0; i < polaPiksela; i++)  {
    prva.pixels[i] = cam.pixels[polaPiksela-1-i];
    treca.pixels[i] = cam.pixels[i]; 
  }
   
 for (int i = 0; i < width; i++) {
   for (int j = 0; j < height/2; j++) {
     int loc = i + j*width;
     druga.pixels[loc] = prva.pixels[width-1-i + j*width];
   }
 }

 prva.updatePixels();
 druga.updatePixels();
 treca.updatePixels();
 
 image(cam, 0, 0);
 image(treca, 0, 0);
 image(druga, 0, height/2);
}
