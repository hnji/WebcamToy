// filter 6

PImage switchRG;

void f_switchRG_setup() { 
  
  // Construct the Capture object  
  switchRG = createImage(width, height, RGB);
  cam = new Capture(this, width, height);  
  cam.start();
  
  ime_filtera = "Switch Red and Green";
}

void f_switchRG_draw() {
 cam.loadPixels();
 switchRG.loadPixels();
 
 for(int x = 0; x < width; x++) {
   for(int y = 0; y < height; y++) {
     float d = dist(x, y, width/2, height/2);
     int loc = x + y*width;
     
     float r = red(cam.pixels[loc]);
     float g = green(cam.pixels[loc]);
     float b = blue(cam.pixels[loc]);
     //float bright = (r + g + b) / 3;

     //if(r>g || r>b)
       switchRG.pixels[loc] = color(g, r, b);
     //else 
      // switchRG.pixels[loc] = cam.pixels[loc];
 
   }
 }
  switchRG.updatePixels();
  image(cam, 0, 0);
  image(switchRG, 0, 0);
}
