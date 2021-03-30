PImage pozadina;

void background_setup(){
  pozadina = loadImage("pozadina.png");
}

void draw_background(){
  image(pozadina,0,0);
}
