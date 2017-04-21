class Luke{
  PImage luke;
  PFont font;
  Luke(){
    font  = loadFont("CenturyGothic-28.vlw");
    luke = loadImage("luke.png");
    textFont(font);
  }
  void speech(){
    background(0);
    fill(255,255,255);
    image(luke, 0,0);
    textSize(16);
    text("Luke Skywalker", 250,405); 
  }
}