player p;
enemy[] e;

int r,g,b;
boolean lost = false;
boolean start = false;
boolean reset = false;
int ammount = 40;


void setup(){
  
   p = new player(15,20,20);
   e = new enemy[ammount];
   noStroke();
   
   for(int i =0;i<ammount;i++){
   e[i] = new enemy();
   e[i].setRandomDir();
   }
  
   noCursor();
   size(800,800);
}


void draw(){
  
  r = int(map(mouseX,0,width,0,255));
  g = int(map(mouseY,0,height,0,255));
  b = int(map(mouseX,0,width,255,0));
  background(r,g,b);
  
  
  if(lost){
    
    fill(0, 102, 153);
    text("You lose", 20, 40);
    

  }
  
  
  if(!start){
  text("Click on your mouse to start", 20, 40);
  if(mousePressed){
   start = true;
  }
  }
  
  
   p.drawObject();
   
    for(int i=0;i<ammount;i++){
     e[i].drawObject();
     if(start){
     if(p.checkCollision(e[i].getX(),e[i].getY(),e[i].getR())){
        textSize(32);
        fill(0, 102, 153);
        
        lost = true;
        
     }
     e[i].move();
     
      }
    }
}




class enemy{
  
  int speed = int(random(1,4));
  int dirX = 1;
  int dirY = 1;
  int size = int(random(20,80));
  int posX = int(random(0+size,width-size));
  int posY = int(random(0+size,height-size));
  
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0,255));
  
  
  void setRandomDir(){
  int Xdir = int(random(0,2));
  int Ydir = int(random(0,2));
  
  if(Xdir==0){
    dirX=1;
  }else{
    dirX=-1;
  }
  
  if(Ydir==0){
    dirY=1;
  }else{
    dirY=-1;
  }
    
  }
  
  void move(){
    
    
    if(posX-size/2<=0 || posX>=width-size/2){
      dirX*=-1;
    }
    if(posY>=width-size/2 || posY-size/2<=0){
      dirY*=-1;
    }
    
     posX+=(dirX*speed);
    posY+=(dirY*speed);
      
    
  }
  
  void drawObject(){
  
    fill(r,g,b);
    ellipse(posX,posY,size,size);
    
  }
  
  float getX(){
  return posX;
  }
  
  float getY(){
  return posY;
  }
  
  float getR(){
  return size;
  }
  
  
}

class player{

  int size=20;
  int speed;
  int growspeed;
  int posX = 500;
  int posY = 500;
  
  player(int s, int sp , int gs){
  
  size = s;
  speed = sp;
  growspeed = gs;
  
  }
  
  void drawObject(){
    ellipse(posX,posY,size,size);
    posX = mouseX;
    posY= mouseY;
  }
  
  boolean checkCollision(float x, float y, float r) { 
  
    if (posX + size/2 + r/2 > x 
    && posX < x + size/2 + r/2
    && posY + size/2 + r/2 > y
    && posY < y + size/2 + r/2){
      return true;
    }else{
      return false;
    }
  }
  

}
