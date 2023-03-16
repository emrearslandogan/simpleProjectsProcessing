class Bird{
  // bird is just a ellipes at this point 
  float bird_velocity = 0; // only horizontal axis
  float bird_acceleration = 0.2; // gravity
  float locY = height/2;
  boolean alive = true;
  int radius = 50;
  
  void birdDisplay(){
    if (locY < -90){
      alive = !alive;
    }
    fill(255,255,0);
    circle(200, locY, radius);
  }
  
  void birdJump(){
    bird_velocity = -7;
  }

  void birdMove(){
    locY += bird_velocity;
    bird_velocity += bird_acceleration;
    
    if (locY > height+20) {// checking if floppy fell from the world   
      alive = false;  
    }
  }
  
  void reset(){
    bird_velocity = 0; // only horizontal axis
    bird_acceleration = 0.2; // gravity
    locY = height/2;
    alive = true;
    radius = 50;
  }
  
}