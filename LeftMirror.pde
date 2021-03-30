// filter 7

PImage lijevo, desno;


void f_leftmirror_setup() {
 cam = new Capture(this, width, height);
 lijevo = createImage(width/2, height, RGB);
 desno = createImage(width/2, height, RGB);
 
 cam.start();
 
 ime_filtera = "Left Mirror";
  
  
}


void f_leftmirror_draw() {
  cam.loadPixels();
 lijevo.loadPixels();
 desno.loadPixels();
 
 for (int i = 0; i < width/2; i++) {
   for (int j = 0; j < height; j++) {
     int loc = i + j*(width/2);
     //int loc2 = (cam.width - i - 1) + j*cam.width;
      //lijevo.pixels[loc] = cam.pixels[i+j*cam.width];
      //desno.pixels[loc] = lijevo.pixels[320-i-1 + j*320];
      desno.pixels[loc] = cam.pixels[(cam.width - i - 1) + j*cam.width];
      lijevo.pixels[loc] = desno.pixels[width/2-i-1 + j*(width/2)];
     
   }
 }
 lijevo.updatePixels();
 desno.updatePixels();
 
 
 image(cam, 0, 0);
 image(lijevo, width/2 ,0);
 image(desno, 0, 0);
}
