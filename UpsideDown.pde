//filter 8

PImage upsidedown;

void f_upside_down_setup() {
  size(1024, 768);
  upsidedown = createImage(width, height, RGB);
  cam = new Capture(this, width, height);
  cam.start();
  
  ime_filtera = "Upside Down";
}


void f_upside_down_draw() {
  cam.loadPixels();
  upsidedown.loadPixels();
 for(int i = 0; i < width*height; i++) {
   upsidedown.pixels[i] = cam.pixels[width*height-i-1];
 }
 
 upsidedown.updatePixels();
 image(cam, 0, 0);
 image(upsidedown, 0, 0);
}
