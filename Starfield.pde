particle [] bob = new particle[500];
void setup(){
  size(400,400);
  for(int i = 0; i < bob.length; i++){
    bob[i] = new particle();
  }
  bob[0] = new OddballParticle();
}
void draw(){
  background(0);
  for(int i = 0; i < bob.length; i++){
    fill(0);
    ellipse(200,200,10,10);
    bob[i].move();
    bob[i].show();
    if(bob[i].myX > 400 || bob[i].myX < 0){
      bob[i].myX = 200;
      bob[i].myY = 200;
      bob[i].mySpeed = (Math.random()*2)+1;
    }
  }
}

class particle{
  double myX, myY, myAngle, mySpeed;
  int myColor;
  particle(){
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()*2+1;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
 
  void move(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
 
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY,5,5);
  }
}

class OddballParticle extends particle{
  OddballParticle(){
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()*2;
    myColor = color(255);
  }
 
  void move(){
    myX = myX + ((int)(Math.random()*5)-3) + Math.cos(myAngle);
    myY = myY + ((int)(Math.random()*5)-3) + Math.sin(myAngle);
  }
 
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY,50,50);
  }
}
