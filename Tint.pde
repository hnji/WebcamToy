//19

void f_red_tint_setup() {
  cam = new Capture(this, width, height);
  cam.start();
  ime_filtera = "Red tint";
}

void f_red_tint_draw(){
  tint(255, 0, 0);
  image(cam, 0, 0);
}


//20

void f_green_tint_setup() {
  cam = new Capture(this, width, height);
  cam.start();
  ime_filtera = "Green tint";
}

void f_green_tint_draw(){
  tint(0, 255, 0);
  image(cam, 0, 0);
}

// 21

void f_blue_tint_setup() {
  cam = new Capture(this, width, height);
  cam.start();
  ime_filtera = "Blue tint";
}

void f_blue_tint_draw(){
  tint(0, 0, 255);
  image(cam, 0, 0);
}
