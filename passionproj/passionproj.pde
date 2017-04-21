PImage img2, img;
int State;
float x;
float y;
PFont font;
  
Title sTitle;
Targeting cTargeting;
Following cFollowing;
Button pButton;
Crawl sCrawl;
Luke sLuke;
Movie theMov; 
Movie theMov2;
Movie theMov3; 
Movie voice;
While dWhile;
Link link;
Point[] p = new Point[30];
Tie tie;


import ddf.minim.*;
Minim minim;
AudioPlayer song;
import processing.video.*;


void setup(){
  size(500, 500, P3D);
  sTitle = new Title();
  cTargeting = new Targeting();
  cFollowing = new Following();
  pButton = new Button();
  sCrawl = new Crawl();
  sLuke = new Luke();
  minim = new Minim(this);
  song = minim.loadFile("opening_theme.mp3");
  theMov = new Movie(this, "transit.mov");
  theMov2 = new Movie(this, "knockout.mov");
  theMov3 = new Movie(this, "explosion.mov");
  voice = new Movie(this, "obiwan.mp4");
  dWhile = new While();
  font = loadFont("CenturyGothic-28.vlw");
  img = loadImage("spin.png");
  img2 = loadImage("award.png");
  tie = new Tie();

  shininess(5.0);
  textFont(font);
  textMode(MODEL);
  initial();
  smooth();
  for (int i = 0; i < p.length; i++) {
    p[i] = new Point();
  }
  link = new Link(p);
}

void initial(){
    State = 1;
    song.play();
    pButton.keyPressed();
}

void draw(){
  if (State == 1){
     pButton.keyPressed();
     sTitle.intro();
}  
  else if (State == 2){   sCrawl.script();
   pButton.keyPressed();
  }
  else if (State == 3){
    song.close();
    background(0);
    theMov.play();
    image(theMov, 0, 50, 500, 400);
    theMov.read();
    textSize(16);
    text("(Press 4 to continue/skip \nBACKSPACE to quit)", width/2, 430);
    fill(255,255,255);
    pButton.keyPressed();
  }
  else if (State == 4){
    background(51);
    cTargeting.display();
    cTargeting.keyPressed();
    textSize(16);
    text("(Press ENTER to continue/skip \nBACKSPACE to quit)", width/2, 50);
    pButton.keyPressed();
  }
  else if (State == 11){
    tie.bground();
    text("(BONUS GAME\n Press 5 to continue/skip \nBACKSPACE to quit click to shoot)", width/2, 50);
    pButton.keyPressed();
  }
  else if (State == 5){
    background(0);
    textSize(16);
    text("(Press 6 to continue/skip \nBACKSPACE to quit)", width/2, 430);
    fill(255,255,255);
    theMov2.play();
    image(theMov2, 0, 0, 500, 400); 
    theMov2.read();
    pButton.keyPressed();
  }
  else if (State == 6){
    sLuke.speech();
    voice.play();
    voice.read();
    textSize(16);
    text("(Press 7 to continue/skip \nBACKSPACE to quit)", width/2, 440);
    pButton.keyPressed();
  }
  else if (State == 7){
    background(0);
    theMov3.play();
    image(theMov3, 0, 0, 500, 400); 
    theMov3.read();
    textSize(16);
    text("(Press 8 to continue/skip \nBACKSPACE to quit)", width/2, 430);
    fill(255,255,255);
    pButton.keyPressed();
  }
  else if (State == 8){
    dWhile.dots();
    textSize(16);
    text("(Press 9 to continue/skip \nBACKSPACE to quit)", width/2, 400);
    fill(255,255,255);
    pButton.keyPressed();
  }
  else if (State == 9){
    background(0);
    link.display();
    textSize(16);
    text("(Press 0 to continue/skip \nBACKSPACE to quit)", width/2, 400);
    fill(255,255,255);
    pButton.keyPressed();
  }
  else if (State == 10){
    background(255);
    noStroke();
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("That's all! \n Thank you for playing!", width/2, 420);
    image(img2, 0,0 );
    pButton.keyPressed();
  }
}