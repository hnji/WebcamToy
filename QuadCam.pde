//filter 12
//neuspjesno probala maknut crtu

void f_quadcam_setup() {
 size(1024, 768);
 
 cam = new Capture(this, width/2, height/2);
 prva = createImage(width/2, height/2, RGB);
 druga= createImage(width/2, height/2, RGB);
 treca = createImage(width/2, height/2, RGB);
 cetvrta = createImage(width/2, height/2, RGB);

 cam.start();  
 ime_filtera = "Quad Cam";
}

void f_quadcam_draw() {
  
 image(cam, 0, 0);
 image(cam, width/2, 0);
 image(cam, 0, height/2);
 image(cam, width/2, height/2);
}
