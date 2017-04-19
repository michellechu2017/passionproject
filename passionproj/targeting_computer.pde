class Targeting{
  float a,b,c;
  int begin, duration, time, State;
  Targeting() {   
    a = 80;
    b = width-65;
    begin = millis();
    time = duration = 10000;
}
  void display(){
    time = duration;
    color c = color(255,204,0);
    stroke(c);
    strokeWeight(1);
    noFill();
    arc (380,300,90,100, 0, HALF_PI);
    arc (380,150,90,100, PI+HALF_PI, TWO_PI);
    arc (125,300,90,100, HALF_PI, PI);
    arc (130,150,100,100, PI, PI+HALF_PI);
    line(80,150,80,300);
    line(425,150,425,300);
    line(140,100,140,350);
    line(370,100,370,350);
    line(190,100,190,350);
    line(325,100,325,350);
    line(230,178,230,277);
    line(285,178,285,277);
    line(250,210,250,240);
    line(265,210,265,240);
    line(125,350,390,100);
    line(125,100,390,350);
    line(190,350,325,100);
    line(190,100,325,350);
    line(80,158,425,290);
    line(80,290,425,165);
    line(80,100,425,100);
    line(80,350,425,350);
    line(230,278,286,278);
    line(249,240,265,240);
    rect(140, 390, 230, 55, 7);
    c = color(240,39,39);
    stroke(c);
    line(a, 100, a, 350);  
    line(b, 100, b, 350);
    a = a + 0.5;
    if (a >= width/2+7) { 
      a = 80; 
    }
     b = b - 0.5;
    if (b <= width/2+7) { 
      b = width-65; 
    }
    if (time > 0)  time = duration - (millis() - begin)/15;//10 <- increase # to slow down countdown;
      fill(c);
      text(time, 250,430);
      text("00", 200,430);
    
    if (time <=0){ 
      time = duration = 0;
    }
  }
  void keyPressed() {
    if(keyCode == ENTER){
      if (a >= width/2-14 && b <= width/2+14){
      //noLoop();
       State = 7; 
      }
      if (a <= width/2-14 && b >= width/2+14) {
      text("Try Again", 250, 480);
      }
    }
  }
}