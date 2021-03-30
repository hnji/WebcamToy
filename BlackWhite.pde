//filter 4

void f_blackwhite_setup() {
  prva = createImage(width, height, RGB);
  cam = new Capture(this, width, height);
  cam.start();
  ime_filtera = "Black and white";
}

void f_blackwhite_draw() {
 cam.loadPixels();
 prva.loadPixels();
 for(int i = 0; i < ukupnoPiksela; i++) {
   if (brightness(cam.pixels[i]) < 127)
     prva.pixels[i] = color(0,0,0);
   else
     prva.pixels[i] = color(255,255,255);
 }
 prva.updatePixels();
 image(cam, 0, 0);
 image(prva, 0, 0);
 
}
