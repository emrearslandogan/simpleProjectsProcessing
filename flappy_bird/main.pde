// TODO interface class to play and to display high score of the round
// display the sucessful passes

// TODO interface class to play and to display high score of the round
// display the sucessful passes

Bird floppy;
ArrayList<Pipes> our_pipes= new ArrayList<Pipes>();
boolean started;

void initialize(){  // to be able to reset in future we initialize every value at the beginning in a separate function
  our_pipes.clear(); 
  floppy  = new Bird();
  started = false;
  
  int[] begXLocs = new int[10];
  
  for (int i = 0; i < 10; i++){     // creating x values for beginning use
    begXLocs[i] = 1200 + (i-1)*600; //linear fuction for x'es
  }
  
  for (int i = 0; i < 10; i++){     // we will add 10 pipes at the beginning
    our_pipes.add(new Pipes(1200+ (i-1)*600));
  } 
}

void setup(){
  size(1500,1000);
  initialize();
}

void draw(){
  background(255);

  
  if (floppy.alive){
    main_gameLoop();
  }// main game loop

  else{
    background(255, 102, 102);
    if (keyPressed){
      initialize();  // reset everything if key is pressed
    }
  }
}


void mousePressed(){
  if (!started){
    started = !started;
    return;
  }
  floppy.birdJump();
}

void main_gameLoop(){
    floppy.birdDisplay(); // displaying bird and pipes even when the game has started
    if (our_pipes.get(0).xLoc < -200){  // checking and adding-removing desired pipes
      our_pipes.remove(0);
      our_pipes.add(new Pipes(our_pipes.get(our_pipes.size()-1).xLoc + 600));
    }
    for (int i = 0; i < our_pipes.size(); i++){
      our_pipes.get(i).displayPipe();
    }
    
    if (started){

      floppy.birdMove(); 
      
      for(int i = 0; i < our_pipes.size(); i++){
        our_pipes.get(i).displayPipe();
        our_pipes.get(i).pipeMove();
      }
      if (checkIntercept(our_pipes.get(0), floppy)){
        floppy.alive = !floppy.alive;
      }
    }
  }


boolean checkIntercept(Pipes pipe, Bird bird){
  if (bird.locY <= pipe.rect_endt + pipe.d /2){ // checking top rect
    if (dist(200, bird.locY, pipe.xLoc, bird.locY) <= bird.radius/2-5 && bird.locY <= pipe.rect_endt){  //crashing from the sides
      return true;
    }
    else if(pipe.xLoc + pipe.d /2> 200-bird.radius/2 && pipe.xLoc < 200+ bird.radius/2 && bird.locY-bird.radius/2 < pipe.rect_endt){
      return true;
    }
  }
  
  else{  // checking bottom rectange
    if (dist(200, bird.locY, pipe.xLoc, bird.locY) < bird.radius/2 && bird.locY >= pipe.rect_endb){
      return true;
    }
    else if(pipe.xLoc + pipe.d /2> 200-bird.radius/2 && pipe.xLoc < 200+ bird.radius/2 && bird.locY + bird.radius/2 > pipe.rect_endb){
      return true;
    }
  }
  return false;
}
