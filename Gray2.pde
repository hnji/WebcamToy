// filter 5

PImage gray;

void f_gray2_setup() { 
   
  gray = createImage(width, height, RGB);
  cam = new Capture(this, width, height);  
  cam.start();
  
  ime_filtera = "Gray 2";
}

void f_gray2_draw() {
 //background(51);
 cam.loadPixels();
 gray.loadPixels();
 image(cam, 0, 0);
 for (int y = 0; y < height; y++) {
   for (int x = 0; x < width; x++) {
     int index = x + y * cam.width;
     float r = red(cam.pixels[index]);
     //float g = green(cam.pixels[index]);
     //float b = blue(cam.pixels[index]);
     //float bright = (r + g + b) / 3;
     //color c = color(bright, bright, bright, 255);

     gray.pixels[index] = color(r,r,r);
     
   }
 }
   
  gray.updatePixels();
  image(gray, 0, 0);
  
}
