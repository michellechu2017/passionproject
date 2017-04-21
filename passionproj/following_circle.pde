class Following{
  float x = 100;
  float y = 100;
  Following(){
    stroke(255,100);
  }
  void move(){
   float dx = mouseX - x;
   float dy = mouseY - y;
   x = mouseX; 
   y = mouseY; 
   ellipse(x, y, 10, 10);
   pushMatrix();
   translate(x, y);
   popMatrix();
}
}