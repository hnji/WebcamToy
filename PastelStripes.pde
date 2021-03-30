// filter 16



void f_pastelstripes_setup() {
  cam = new Capture(this, width, height);
  cam.start();
 
  ime_filtera = "Pastel Stripes";

}


void f_pastelstripes_draw() {
  //frameRate(50);
   image(cam, 0, 0);
   noStroke();
   for(int i = 0; i <= 40; i++) {
     //frameRate(10);
     int index = (int)random(4);
     fill(colors[index], 170);
     rect(i*sirinaTrake, 0, sirinaTrake, height*2);
   }
  
}
