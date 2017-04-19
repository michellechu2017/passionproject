class Crawl{
  PFont font;
  float ang = 0.0;
  float y = 200;
  float z = -300;
  float x = 250;
    Crawl(){
      font = loadFont("CenturyGothic-28.vlw");
      textFont(font);
      textMode(MODEL);
      textSize(20);
  }
  void script() {
    background(0);
    rotateX(PI/4);
    strokeWeight(5);
    directionalLight(350, 100, 0, 0, -200, -200);
    colorMode(RGB, 243, 93, 99);
  
    text("Battle of Yavin 2", x, y, z);
    text("Having rescued Princess Leia ", x, y+100, z);
    text("from captivity of the Galactic", x, y+175, z);
    text("Empire; Han Solo, Chewbacca,", x, y+250, z);
    text("Luke, and a squadron", x, y+325, z);
    text("returned to the Death Star", x, y+400, z);
    text(" for an assault.", x, y+475, z);
    
    text("Together, they conspired to take", x, y+650, z);
    text("down the ultimate weapon before the", x, y+725, z);
    text("empire could use its superlaser to", x, y+800, z);
    text("annihilate the rebel base on Yavin IV.", x, y+875, z);
    
    text("Their plan was to slip through the", x, y+975,z);
    text("main defenses, and shoot proton", x, y+1050, z);
    text("torpedoes into a thermal exhaust", x, y+1125, z);
    text("port that would allegedly cause a", x, y+1200, z);
    text("chain reaction leading to the ", x, y+1275, z);
    text("destruction of the Death Star.", x, y+1350, z);
    text("(Please press 3 to continue.)", x, y+1425, z);
    
  y--;
}
}