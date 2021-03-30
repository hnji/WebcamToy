//filter 16

void f_inverse_setup() {
  cam = new Capture(this, width, height);
  prva = createImage(width, height, RGB);
 
 cam.start(); 
 ime_filtera = "Inverse";
  
}


void f_inverse_draw() {
 cam.loadPixels();
 prva.loadPixels();
 
 for(int x = 0; x < width * height; x++)
     prva.pixels[x] = color(255-red(cam.pixels[x]), 255-green(cam.pixels[x]), 255-blue(cam.pixels[x]));

  prva.updatePixels();
  image(cam, 0, 0);
  image(prva, 0, 0);
  
}
