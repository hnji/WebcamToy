// filter 13


void f_quadmirror_setup() {
   prva = createImage(width/2, height/2, RGB);
   druga = createImage(width/2, height/2, RGB);
   treca = createImage(width/2, height/2, RGB);
   cetvrta = createImage(width/2, height/2, RGB);
  
   cam = new Capture(this, width/2, height/2);
   cam.start();  
   ime_filtera = "Quad Mirror";
}

void f_quadmirror_draw() {
  cam.loadPixels();
  prva.loadPixels();
  druga.loadPixels();
  treca.loadPixels();
  cetvrta.loadPixels();
  
  for (int i = 0; i < ukupnoPiksela/4; i++) {
    prva.pixels[i] = cam.pixels[ukupnoPiksela/4-1-i];
    cetvrta.pixels[i] = cam.pixels[i];

  }
   for (int i = 0; i < width/2; i++) {
     for (int j = 0; j < height/2; j++) {
       int loc = i + j*(width/2);
       int loc2 = (width/2)-1-i + j*(width/2);
       druga.pixels[loc] = cam.pixels[loc2];
       treca.pixels[loc] = prva.pixels[loc2];
     }
   }
   
   prva.updatePixels();
   druga.updatePixels();
   treca.updatePixels();
   cetvrta.updatePixels();
   image(cam, 0, height/2); 
   image(prva, width/2, 0);         // zapravo druga (gornja desna)
   image(druga,width/2, height/2);  // zapravo četvrta (donja desna)
   image(treca, 0, 0);              // zapravo prva (gornja lijeva)
   image(cetvrta, 0, height/2);     // zapravo treća (donja lijeva)
}
