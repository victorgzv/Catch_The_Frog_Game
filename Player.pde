class Player{
   boolean bounced;
   int size;
   float xpos,ypos,acceleration,vspeed,hspeed;
   color Color;
  public Player(int x, int y, float speed, int size,color c){
        this.xpos=x;
        this.ypos=y;
        this.vspeed=speed;
        this.hspeed=0;
        this.size=size;
        this.acceleration=0.07;
        this.Color=c;
  }
  void render(){ 
          ypos+=vspeed;//Increase verticall speed
          //bounce off walls
          if (xpos>800){//Left wall
            hspeed=-0.7*hspeed;
            xpos=800;
          }
          if (xpos<0){//right wall
            hspeed=-0.7*hspeed;
            xpos=0;
          }
          //bounce off top of screen
          if (ypos<0){
            vspeed=-0.5*vspeed;
            ypos=0;
          }
          //Reach bottom of the screen
          if (ypos>height){
          score=0;
          //Reset Game
          gameState="LOSE";
           
          }
         xpos+=hspeed;//Increase horizontal speed
          fill(Color);
          ellipse(xpos,ypos,size,size);
  
  }
  //Calculate distance between player and platforms
  boolean collisionListener(Platform a){
    
    if(dist(this.xpos, this.ypos, a.xpos, a.ypos) < this.size + a.size) { 
       return true;
    } else { 
       return false;
    }
  }
  void update(Platform a, Platform b){
            //Player hitting the platforms
          if ((this.collisionListener(a) ||  (this.collisionListener(b))) && vspeed>0)
              {
              acceleration=-4;
            
              //bounce effect
              if (vspeed>0){
              vspeed=-0.5*vspeed;}
              }
          else
              {
              acceleration=0.09;
              }
          //vertical speed limiter
          if (pow(vspeed,2)<pow(12,2))
              {
              vspeed+=acceleration;
              }
          else
              {
               vspeed=12; 
              }
              render();
       
   }
}