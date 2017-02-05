class Power extends GameObject{
    String type;
    color mycolor;
    boolean active;
    float size,speed,duration,time,xpos,ypos;
    int magnettime,jettime,sizetime,slowtime;
    int sizecheck,magnetcheck,jetcheck,slowcheck,timecheck;
    String [] powers={"jet pack","size +","slowmo","magnet"};
    color [] powercolors={#00ff66,#ff00ff,#006666};
public Power(){
            active=false;
            speed=2;
            timecheck=0;
            //time to next spawn
            randomTime();
            pos.x=0;
            pos.y=300;
            size=25;
            type=randomPower();

}
 void update(Player a){
 
 
 
 
 }
 void render(){
 
 
 }
 
String randomPower(){
   int a=int(random(0,3));
   mycolor=powercolors[a];
   return(powers[a]);
}
void randomTime(){
   time=second();
   timecheck=(second()+5+int(random(5,15)));
}
     //Calculate distance between player and power ball
  boolean collisionListener(Player a){
    
    if(dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
       return true;
    } else { 
       return false;
    }
  }

}