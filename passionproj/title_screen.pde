class Title{
  PImage title;
  int time;
  Title(){
    title = loadImage("title_screen.png");
    textAlign(CENTER);
}
  void intro(){
    image(title,0,0);
    text("Press 2 to continue/skip \nBACKSPACE to quit", width/2, height/2-25);
      if (millis() - time >= 100) {
            time = millis();
            fill(0);
      }
      else if (millis() - time <= 400){
            fill(255,255,255);
      }
}
}