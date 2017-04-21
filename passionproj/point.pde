class Point {
  float x, y, lastX, lastY, nextX, nextY, velX, velY, a;
  float deltaTScale = 570;
  float deltaT = .05;
  boolean followMouse = false;
  Point() {
  }

  void move(boolean pin) {
    if (pin == false) {
      velX = x - lastX;  //  this is where velocity is calculated with verlet integration
      velY = y - lastY;

      velX *= .97;
      velY *= .97;

      nextX = x + velX;
      nextY = y + velY;  //  add .1 to add gravity

      lastX = x;
      lastY = y;

      x = nextX;
      y = nextY;
    }  
    else {
      if (followMouse == false) {  //  the tether travels in a circle, normally
        fill(255,255,255);
        deltaTScale = slider(deltaTScale, 430, 35, "Orbit Speed");
        // this follows the format: lowerBound + ((whateverScale + 40 - x)/80)*(upperBound - lowerBound);
        deltaT = .01 + ((deltaTScale + 27 - 400)/80)*(.2 - .01);
        circlePath();
      }  
      else {
        x = mouseX;  //  ...or it follows the mouse
        y = mouseY;
      }
    }
  }
  void circlePath() {  //  create the circular path
    a += deltaT;
    x = cos(a)*130 + width/2;
    y = sin(a)*130 + height/2;
    translate(width/2, height/2);
     rotate(a);
     translate(-img.width/2, -img.height/2);
     image(img, 0,0);
    if (a > 2*PI) {
      a = 0;
    }
  }

  float slider(float b, float x, float y, String title) {  //  creates sliding scales where 'a' is the location of the slider
    stroke(255,255,255);
    line(x - 40, y, x + 40, y);
    line(x - 40, y - 5, x - 40, y + 5);
    line(x + 40, y - 5, x + 40, y + 5);
    noStroke();
    fill(255,255,255);
    textSize(12);
    textAlign(CENTER);
    text(title, x, y - 10);
    textAlign(LEFT);
    if (mouseX >= x - 40 && mouseX <= x + 40 && mouseY >= y - 5 && mouseY <= y + 5 && mousePressed) {
      b = mouseX;
      if (b < x - 40) {
        b = x - 40;
      }
      if (b > x + 40) {
        b = x + 40;
      }
    }
    fill(150, 150, 150);
    ellipse(b, y + 1, 10, 10);
    return b;
  }
}