class Tie{
    PImage img;
    int score;
    int TIESize = 20;
      boolean fire = false;
     int gameOver = 0;
      int getRandomX()
  {
    return int(random(500));
  } 
  int[] TIEx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] TIEy = { 0, 0, 0, 0, 0 };
    Tie(){
      smooth ();
      img = loadImage("spin.png");
    }
    
  void bground(){
   background (0);
    fill(255);
    stroke (255);
    triangle(mouseX-8, 480, mouseX+8, 480, mouseX, 465);
    text(score, 20,20);
    if(fire){
      cannon(mouseX);
      fire = false;
    }
     TIEFalling();
       mousePressed();
  }
 
  void mousePressed(){
    if (mouseButton == LEFT){
    fire = true;
    }
  }
  
  void TIEFalling(){  
    stroke(39, 154, 240); 
    fill (39, 154, 240);     
    for (int i=0; i<5; i++){
      image(img, TIEx[i], TIEy[i]++, TIESize, TIESize);
    }
  }
  
  void cannon(int shotX){
    boolean strike = false;
    for (int i = 0; i < 5; i++){
      if((shotX >= (TIEx[i]-TIESize)) && (shotX <= (TIEx[i]+TIESize))) {
        strike = true;
        line(mouseX, 565, mouseX, TIEy[i]);
        ellipse(TIEx[i], TIEy[i],
                TIESize+25, TIESize+25);
        TIEx[i] = getRandomX();
        TIEy[i] = 0;
        score++;
      }    
    }
  
    if(strike == false){
      line(mouseX, 465, mouseX, 0);
    }    
  }  
    }
  