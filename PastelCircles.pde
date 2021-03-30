// filter 17


void f_pastelcircles_setup() {
  cam = new Capture(this, width, height);
  cam.start();
  ime_filtera = "Pastel Circles";

}


void f_pastelcircles_draw() {
   image(cam, 0, 0);
   noStroke();
   for(int i = 0; i <= 40; i++) {
     int index = (int)random(4);
     fill(c1, 10);
     rect(0, 0, width, height);
     fill(colors[index], 170);
      
     ellipse((int)random(width), (int)random(width), 50, 50);
   }
  
}
