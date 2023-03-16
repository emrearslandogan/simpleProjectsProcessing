class Pipes{
  // it will have to random values, they will be different by d. they are the end coordinates of that pipe (y, x is variable)

  int d = 200; // distance between top and bottom rectangle
  float xLoc;
  
  int rect_endt;
  int rect_endb;
  int pipe_speed; // 5
  int rect_width; // 100


  Pipes (float tempX){
    xLoc = tempX;
    rect_endt = int(random(200, height - 300));
    rect_endb = rect_endt + d;
    rect_width = 100;
    pipe_speed = 5;
  }
  
  void pipeMove(){
    xLoc -= pipe_speed;
    }
        
  void displayPipe(){
    fill (0);
    rect(xLoc, 0, rect_width, rect_endt);
    rect(xLoc, rect_endb, rect_width, height);
  }
  
}