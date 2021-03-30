//// filter 17

//PGraphics2D pg_src_C;

//int BLUR_RADIUS = 20;

//void f_dog_setup() {
 
//  DwPixelFlow context = new DwPixelFlow(this);
//  context.print();
//  context.printGL();
  
//  cam = new Capture(this, width, height, 30);
//  cam.start();
  
//  filter = new DwFilter(context);
//  pg_src_A = (PGraphics2D) createGraphics(width, height, P2D);
//  pg_src_A.smooth(8);
  
//  pg_src_B = (PGraphics2D) createGraphics(width, height, P2D);
//  pg_src_B.smooth(8);
//  pg_src_B.beginDraw();
//  pg_src_B.clear();
//  pg_src_B.endDraw();
  
//  pg_src_C = (PGraphics2D) createGraphics(width, height, P2D);
//  pg_src_C.smooth(8);
//  ime_filtera = "Dog";

//}


//void f_dog_draw() {
  
//   pg_src_A.beginDraw();
//   {
//      pg_src_A.rectMode(CENTER);
//      pg_src_A.clear();
//      pg_src_A.background(255);
      
//      pg_src_A.image(cam, 0, 0, width, height);
//   }
//   pg_src_A.endDraw();
    
//  filter.dog.param.kernel_A = BLUR_RADIUS * 2;
//  filter.dog.param.kernel_B = BLUR_RADIUS * 1;
//  filter.dog.param.mult  = 2.5f;
//  filter.dog.param.shift = 0.5f;
//  filter.dog.apply(pg_src_A, pg_src_B, pg_src_C);
//  swapAB();
        
//  background(0);
//  blendMode(REPLACE);
//  image(pg_src_A, 0, 0);
//  blendMode(BLEND);
//}
