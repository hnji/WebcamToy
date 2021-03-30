// (filter 16) --- filter1, maknut mirror

PGraphics2D pg_src_A;
PGraphics2D pg_src_B;
DwFilter filter;

void f_sobel_setup(){
  DwPixelFlow context = new DwPixelFlow(this);
  //context.print();
  //context.printGL();
  
  cam = new Capture(this, width, height, 30);
  cam.start();
  
  filter = new DwFilter(context);
  pg_src_A = (PGraphics2D) createGraphics(width, height, P2D);
  pg_src_A.smooth(8);
  
  pg_src_B = (PGraphics2D) createGraphics(width, height, P2D);
  pg_src_B.smooth(8);
  pg_src_B.beginDraw();
  pg_src_B.clear();
  pg_src_B.endDraw();
  
  ime_filtera = "Sobel";
}

void f_sobel_draw(){
  if(cam.available()) {
    cam.read();
  }
  
   // update input image
  pg_src_A.beginDraw();
  {
    pg_src_A.rectMode(CENTER);
    pg_src_A.clear();
    pg_src_A.background(255);
    
    pg_src_A.image(cam, 0, 0, width, height);
  }
  pg_src_A.endDraw();
  
  filter.sobel.apply(pg_src_A, pg_src_B, Sobel.TYPE._3x3_VERT); swapAB(); 
  
  background(0);
  blendMode(REPLACE);
  image(pg_src_A, 0, 0);
  blendMode(BLEND);
}

void swapAB(){
  PGraphics2D tmp = pg_src_A;
  pg_src_A = pg_src_B;
  pg_src_B = tmp;
}
