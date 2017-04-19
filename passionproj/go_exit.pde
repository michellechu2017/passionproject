class Button{  
  Button(){
  }
  void keyPressed() {
    switch(key){
      case('1'): State = 1; break;
      case('2'): State = 2; break;
      case('3'): State = 3; break;
      case('4'): State = 4; break;
      case('5'): State = 5; break;
      case('6'): State = 6; break;
      case('7'): State = 7; break;
      case('8'): State = 8; break;
      case('9'): State = 9; break;
      case('0'): State = 10; break;
    }
   if (key == BACKSPACE) {
      exit();
  }
  }
}