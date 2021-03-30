// c1
//GUIController photoKontroler;
//IFButton leftButton, rightButton, captureButton, settingsButton;

// c2
//GUIController saveKontroler;
//IFButton saveButton, c2backButton;

// c3
//GUIController settingsKontroler;
//int backgroundColor;
//int blue = 0, red = 1;
//IFButton mirrorImageButton, backgroundColorButton, musicButton, c3backButton;
/*
void c1_setup(){
  photoKontroler = new GUIController (this);
  
  leftButton = new IFButton ("<", 10, 70, 40, 17);
  rightButton = new IFButton (">", 60, 70, 40, 17);
  captureButton = new IFButton ("Capture", 110, 70, 40, 17);
  settingsButton = new IFButton ("Settings", 160, 70, 40, 17);
  
  leftButton.addActionListener(this);
  rightButton.addActionListener(this);
  captureButton.addActionListener(this);
  settingsButton.addActionListener(this);
  
  photoKontroler.add(leftButton);
  photoKontroler.add(rightButton);
  photoKontroler.add(captureButton);
  photoKontroler.add(settingsButton);
  photoKontroler.setVisible(true);
}

void c2_setup(){
  saveKontroler = new GUIController (this);
  
  c2backButton = new IFButton ("Back", 10, 70, 40, 17);
  saveButton = new IFButton ("Save", 60, 70, 40, 17);
  
  c2backButton.addActionListener(this);
  saveButton.addActionListener(this);
  
  saveKontroler.add(c2backButton);
  saveKontroler.add(saveButton);
  saveKontroler.setVisible(false);
}

void c3_setup(){
  settingsKontroler = new GUIController (this);
  
  backgroundColor = blue;
  
  mirrorImageButton = new IFButton ("Mirror", 10, 70, 40, 17);
  backgroundColorButton = new IFButton ("Background color = Blue", 60, 70, 40, 17);
  musicButton = new IFButton ("Music - on", 110, 70, 40, 17);
  c3backButton = new IFButton ("Back", 160, 70, 40, 17);
  
  mirrorImageButton.addActionListener(this);
  backgroundColorButton.addActionListener(this);
  musicButton.addActionListener(this);
  c3backButton.addActionListener(this);
  
  settingsKontroler.add(mirrorImageButton);
  settingsKontroler.add(backgroundColorButton);
  settingsKontroler.add(musicButton);
  settingsKontroler.add(c3backButton);
  settingsKontroler.setVisible(false);
}

void actionPerformed(GUIEvent e) {
  if (aktivanKontroler == 1) {
    if (e.getSource() == captureButton) {  
      cam.stop();
      photoKontroler.setVisible(false); 
      saveKontroler.setVisible(true);
      aktivanKontroler = 2; // javljamo da je sada aktivan drugi kontroler
    }
    if (e.getSource() == leftButton){
      state = (state-1) % brojFiltera;
      if(state < 0) state = state + brojFiltera;
      cam.stop();
      //setup();
      filteri_setup(state);
      //println("state = " + state);
    }
    if (e.getSource() == rightButton){
      state = (state+1) % brojFiltera;
      cam.stop();
      //setup();
      filteri_setup(state);
      //println("state = " + state);
    }
    if (e.getSource() == settingsButton){
      cam.stop();
      settingsKontroler.setVisible(true);
      photoKontroler.setVisible(false);
      aktivanKontroler = 3;
    }
  }
  
  if (aktivanKontroler == 2) {
    if (e.getSource() == c2backButton) {      
      saveKontroler.setVisible(false);
      photoKontroler.setVisible(true);
      aktivanKontroler = 1; // ponovno aktiviramo prvi kontroler
      cam.start();
    }
    if (e.getSource() == saveButton){
      saveFrame("tmp.jpg");
    }
  }

  if (aktivanKontroler == 3) {
    if (e.getSource() == mirrorImageButton) {      
      println("treba mirrorat sliku i zapamtit da tako to ostane!");
    }
    if (e.getSource() == backgroundColorButton){
      if(backgroundColor == blue) backgroundColor = red;
      else backgroundColor = blue;
    }
    if (e.getSource() == musicButton) {      
      println("treba ugasit/upalit muziku");
    }
    if (e.getSource() == c3backButton) {      
      settingsKontroler.setVisible(false);
      photoKontroler.setVisible(true);
      aktivanKontroler = 1; // ponovno aktiviramo prvi kontroler
      //cam.start();
    }
  }
}*/

class CircularButton implements ControllerView<Button> {

  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(200, 60, 0);
      }  else { // mouse hovers the button
        theApplet.fill(200, 160, 100);
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(0, 160, 100);
    }
    
    theApplet.ellipse(0, 0, theButton.getWidth(), theButton.getHeight());
    
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    
    theApplet.popMatrix();
  }
}

Button leftButton, rightButton, captureButton, settingsButton;
Button backFromSaveButton, saveButton;
Button mirrorImageButton, backgroundColorButton, musicButton, backFromSettingsButton;
Textarea filterName;
boolean photoC, saveC, settingsC;
void cp5_setup(){
  
  photoC = true; saveC = false; settingsC = false;
  
  makeButtonsForPhotoC();
  makeButtonsForSaveC();
  makeButtonsForSettingsC();
      
}

void makeButtonsForPhotoC(){
  leftButton = cp5.addButton("<")
      .setValue(0)
      .setPosition(10, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(0)
      ;
  rightButton = cp5.addButton(">")
      .setValue(0)
      .setPosition(70, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(1)
      ;
  captureButton = cp5.addButton("Capture")
      .setValue(0)
      .setPosition(130, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(2)
      ;
  settingsButton = cp5.addButton("Settings")
      .setValue(0)
      .setPosition(190, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(3)
      ;
  filterName = cp5.addTextarea("txt")
      .setPosition(250,70)
      .setColor(255)
      .setColorBackground(color(0, 160, 100))
      .setSize(200,50)
      .setText(ime_filtera);
      
   if(!photoC){ // zapravo ne treba, al za svaki slučaj
     hidePhotoCButtons();
   }
}

void makeButtonsForSaveC(){
  backFromSaveButton = cp5.addButton("Back")
      .setValue(0)
      .setPosition(10, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(4)
      ;
  saveButton = cp5.addButton("Save")
      .setValue(0)
      .setPosition(70, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(5)
      ;
  
  if(!saveC){
    hideSaveCButtons();
  }
}

void makeButtonsForSettingsC(){
  mirrorImageButton = cp5.addButton("Mirror image")
      .setValue(0)
      .setPosition(10, 70)
      .setSize(100,50)
      .setId(6)
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(200, 60, 0)) // button is pressed
      ;
  //backgroundColorButton = cp5.addButton("Color = red")
  //    .setValue(0)
  //    .setPosition(70, 70)
  //    .setSize(50,50)
  //    .setView(new CircularButton())
  //    .setId(7)
  //    ;
      
  musicButton = cp5.addButton("Music on/off")
      .setValue(0)
      .setPosition(130, 70)
      .setSize(100,50)
      .setId(8)
      .setColorBackground(color(0, 160, 100))
      .setColorActive(color(200, 60, 0))
      ;
      
  backFromSettingsButton = cp5.addButton("Back ")
      .setValue(0)
      .setPosition(240, 70)
      .setSize(50,50)
      .setView(new CircularButton())
      .setId(9)
      ; 
  if(!settingsC){
    hideSettingsCButtons();
  }
}

void hidePhotoCButtons(){
  leftButton.hide();
  rightButton.hide();
  captureButton.hide();
  settingsButton.hide();
  filterName.hide();
}

void hideSaveCButtons(){
  backFromSaveButton.hide();
  saveButton.hide();
}

void hideSettingsCButtons(){
  mirrorImageButton.hide();
  //backgroundColorButton.hide();
  musicButton.hide();
  backFromSettingsButton.hide();
}

void showButtons(){
  if(photoC){
    leftButton.show();
     rightButton.show();
     captureButton.show();
     settingsButton.show();
     filterName.show();
  }
  if(saveC){
    backFromSaveButton.show();
    saveButton.show();
  }
  if(settingsC){
    mirrorImageButton.show();
    //backgroundColorButton.show();
    musicButton.show();
    backFromSettingsButton.show();
  }
}

// id-jevi ne tribaju jer su imena isto jedinstvena!
public void controlEvent(ControlEvent theEvent){
  if(!theEvent.isGroup()){
    
    // photoC
    if(theEvent.getController().getId() == 0){ // left button is clicked
      state = (state-1) % brojFiltera;
      if(state < 0) state = state + brojFiltera;
      cam.stop();
      //setup();
      filteri_setup(state);
      filterName.setText(ime_filtera);
    }
    
    if(theEvent.getController().getId() == 1){ // right button is clicked
      state = (state+1) % brojFiltera;
      cam.stop();
      //setup();
      filteri_setup(state);
      filterName.setText(ime_filtera);
    }
    
    if(theEvent.getController().getId() == 2){ // capture button is clicked
      cam.stop();
      hidePhotoCButtons();
      photoC = false;
      saveC = true;
      showButtons();
    }
    
    if(theEvent.getController().getId() == 3){ // settings button is clicked
      //cam.stop();
      photoC = false;
      settingsC = true;
      hidePhotoCButtons();
      showButtons();
    }
    
    // saveC
    if(theEvent.getController().getId() == 4){ // back (from save) button is clicked
      saveC = false;
      photoC = true;
      hideSaveCButtons();
      showButtons();
      cam.start();
    }
    
    if(theEvent.getController().getId() == 5){ // save button is clicked
      saveFrame("tmp.jpg");
    }
    
    // settingsC
    if(theEvent.getController().getId() == 6){ // mirror image button is clicked
      if(settings_mirror)
        settings_mirror = false;
      else
        settings_mirror = true;
    }
    if(theEvent.getController().getId() == 8){ // music button is clicked
      if(musicFlag){
        musicFlag = false;
        song.pause();
      }
      else{
        musicFlag = true;
        song.loop();
      }
        
    }
    
    
    if(theEvent.getController().getId() == 9){ // back (from settings) button is clicked
      settingsC = false;
      photoC = true;
      hideSettingsCButtons();
      showButtons();
      cam.start();
    }
  }
}
