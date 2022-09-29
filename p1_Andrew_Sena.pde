PFont font;
int rect1X, rect1Y;
int buttX, buttY;
int floorX, floorY;
color rectColor, buttColor,baseColor;
color currentColor;
color highlightColor;
boolean rectOver = false;
int rectWidth = 270;
int rectHeight = 90;
int buttWidth = 80;
int buttHeight = 80;
boolean butt1 = false;
boolean butt2 = false;
boolean buttOpen = false;
boolean buttClose = false;
color b1, b2, bO, bC;
int sTime;
int tTime = 3000;



void setup() {
  size(640, 900);
  rectColor = color(0);
  buttColor = color(255);
  baseColor = color(102);
  b1 = b2 = bO = bC = buttColor;
  highlightColor = color(255, 0, 0);
  currentColor = baseColor;
  
  rect1X = width/4-rectWidth/2;
  rect1Y = height/2;
  sTime = millis();
  ellipseMode(CENTER);
  font = createFont("Arial",20,true);
  textFont(font, 50);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  int pTime = millis() - sTime;
  
  if(pTime > tTime){
    if(b1 == highlightColor){
      b1 = buttColor;
    }else if(b2 == highlightColor){
      b2 = buttColor;
    }else if(bO == highlightColor){
      bO = buttColor;
    }else if(bC == highlightColor){
      bC = buttColor;
    }
    sTime = millis();
  }
  
  
  
  
  
  
  fill(rectColor);
  stroke(255);
  rect(rect1X, /*rect1Y+150*/600, rectWidth, rectHeight);
  rect(width-300, 600, rectWidth, rectHeight);
  rect(rect1X, 400, rectWidth, rectHeight);
  rect(width-300, 400, rectWidth, rectHeight);
  
  
  fill(bO);
  rect(width/4-buttWidth/2+40, 605, buttWidth, buttHeight);
  fill(bC);
  rect(width-165, 605, buttWidth, buttHeight);
  fill(b1);
  rect(width/4-buttWidth/2+40, 405, buttWidth, buttHeight);
  fill(b2);
  rect(width-165, 405, buttWidth, buttHeight);
  
  //font
  pushStyle();
  textFont(font, 80);
  fill(255);
  text(">|<", 350, 670);
  popStyle();
  
  pushStyle();
  textFont(font, 80);
  fill(255);
  text("<|>", 40, 670);
  popStyle();
  
  pushStyle();
  textFont(font, 80);
  fill(255);
  text("1", 65, 475);
  popStyle();
  
  pushStyle();
  textFont(font, 80);
  fill(255);
  text("2", 385, 475);
  popStyle();
  //end font
}

void update(int x, int y) {
  if(overRect(width/4-buttWidth/2+40, 605, buttWidth, buttHeight)){
    buttOpen = true; //bottem left button
  }
  else if(overRect(width-165, 605, buttWidth, buttHeight)){
    buttClose = true; //bottom right
  }
  else if(overRect(width/4-buttWidth/2+40, 405, buttWidth, buttHeight)){
    butt1 = true; //upper left 
  }
  else if(overRect(width-165, 405, buttWidth, buttHeight)){
    butt2 = true; //upper right
  }
  else{
    butt1 = false;
    butt2 = false;
    buttOpen = false;
    buttClose = false;
  }
}

void mousePressed() {
  if(buttOpen) {
    bO = highlightColor;
  }else if(buttClose){
    bC = highlightColor;
  }
  else if(butt1){
    b1 = highlightColor;
  }
  else if(butt2){
    b2 = highlightColor;
  }
}

boolean overRect(int x, int y, int width, int height){
  if(mouseX >= x && mouseX <= x+width && 
  mouseY >= y && mouseY <= y+height) {
    return true;
  }else{
    return false;
  }
}
