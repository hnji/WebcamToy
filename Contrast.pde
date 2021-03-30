//filter 18


void f_contrast_setup() {

  cam = new Capture(this, width, height);
  cam.start();
  prva = new PImage(cam.width, cam.height);  
  ime_filtera = "Contrast";
}

void f_contrast_draw() {
  float contrast = 5f;
  float bright = 255 * (- 0.5);
  
  cam.loadPixels();
  prva.loadPixels();
  
   for(int i = 0; i < width*height; i++)
   {  
     color inColor = cam.pixels[i];
     int r = (inColor >> 16) & 0xFF; //like calling the function red(), but faster
     int g = (inColor >> 8) & 0xFF;
     int b = inColor & 0xFF;
     r = (int)(r * contrast + bright); //floating point aritmetic so convert back to int with a cast (i.e. '(int)');
     g = (int)(g * contrast + bright);
     b = (int)(b * contrast + bright);
     r = r < 0 ? 0 : r > 255 ? 255 : r;
     g = g < 0 ? 0 : g > 255 ? 255 : g;
     b = b < 0 ? 0 : b > 255 ? 255 : b;
     prva.pixels[i] = color(r ,g, b);

   }
   cam.updatePixels();
   prva.updatePixels();
   image(cam, 0, 0);

   image(prva, 0, 0);
}
