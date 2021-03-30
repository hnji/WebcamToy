import processing.video.*;
import ddf.minim.*;

// Za kontroler
//import interfascia.*;
import controlP5.*;


// Za filtere
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.Sobel;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import com.thomasdiewald.pixelflow.java.DwPixelFlow;

ControlP5 cp5;
Capture cam;
Minim minim;
AudioPlayer song;

//int aktivanKontroler;

int WindowWidth = 1024, WindowHeight = 768;
int ukupnoPiksela = 1024 * 768;
int polaPiksela = ukupnoPiksela/2;
PImage prva, druga, treca, cetvrta, zamirror;

int state = 0;
boolean settings_mirror = false;
boolean musicFlag = true;
String ime_filtera = "No filter";

color c1, c2, c3, c4, c5;
color[] colors = new color[5];
float sirinaTrake = 25.07;


void setup() {
  size(1024, 768, P2D);
  smooth();
  zamirror = createImage(width, height, RGB);
  
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.loop();
  
  c1 = color(238, 152, 154);
  c2 = color(253, 244, 208);
  c3 = color(239, 181, 229);
  c4 = color(174, 160, 219);
  c5 = color(255, 209, 155);
  colors[0] = c1; colors[1] = c2; colors[2] = c3; colors[3] = c4; colors[4] = c5;
  sirinaTrake = 25.07;

  //String[] cameras = Capture.list();
  
  // prvi kontroler (photoKontroler):
  //c1_setup();
  //aktivanKontroler = 1;
  //
  // drugi kontroler (saveKontroler):
  //c2_setup();
  //
  // treći kontroler (settingsKontroler):
  //c3_setup();
  
  //background_setup();
  
  cp5 = new ControlP5(this);
  
  cp5_setup();
  
  filteri_setup(state);

/*
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, WindowWidth, WindowHeight);
  } else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam.start();
   
  }
  */

}

// Read image from the camera
void captureEvent(Capture cam) {  
  cam.read();
}

void draw() {
  
  //if (cam.available() == true) {
    //cam.read();
  //}
  
  //image(cam, (800-640)/2, 0, 640, 480);
  //if (state == 0) image(cam, 0, 0, WindowWidth, WindowHeight);
  
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(0, 0, cam);
  
  filteri_draw(state);
  
  if(!settings_mirror) {
    loadPixels();
     zamirror.loadPixels();
     for(int i = 0; i < width*height; i++)
       zamirror.pixels[i] = pixels[i];
     for (int i = 0; i < width; i++) {
       for (int j = 0; j < height; j++) {
         pixels[i + j*width] = zamirror.pixels[width - 1 - i + j*width];
     }
       }
    updatePixels();
  }
  
  if(state != 19 && state != 20 && state !=21)
    noTint();
}
