/**
 * Button. 
 * 
 * Click on one of the colored squares in the 
 * center of the image to change the color of 
 * the background. 
 */
Button pButton;

void setup() {
  size(500,500);
  pButton = new Button();
}

void draw() {
 pButton.function();
 pButton.mousePressed();
}