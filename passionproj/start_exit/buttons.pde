class Button{
  
  int rectX, rectY;      // Position of square button
  int rectWidth = 20,rectHeight = 30; // Diameter & height of rect
  color rectColor,rectHighlight;
  boolean rectOver = false;
  
  Button(){
    rectColor = color(0);
    rectHighlight = color(51);
    rectX = width/2-rectWidth-50;
    rectY = height/2-rectHeight/2;
  }

  void function() {
    update(mouseX, mouseY);
    stroke(255);
    rect(rectX, rectY, rectWidth, rectHeight);
  }
  
  void update(int x, int y) {
    if  ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
      rectOver = true;
    } else {
       rectOver = false;
    }
  }
  
  void mousePressed() {
    if (rectOver) {
      background(255);
      noLoop();
    }
  }
  
  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}