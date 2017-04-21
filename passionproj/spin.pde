class Spin{
  int tSize = 18;
  PFont font;
  float a;
  Point[] p = new Point[30];
  Link link;
  PImage img3;
  
  Spin(){
    font = (loadFont("PalatinoLinotype-Roman-18.vlw"));
  noStroke();
  size(500, 500);
  img3 = loadImage("spin.png");
  for (int i = 0; i < p.length; i++) {
    p[i] = new Point();
  }
  link = new Link(p);
  }
}