boolean button = false;

int circleX = 0;
int circleY = 100;
int step = 10;
int incrX = 0;


void setup() {
  size(200, 200);
}
void draw() {
  background(100);
  stroke(255);
  fill(0);
  ellipse(circleX , circleY, 50, 50);
  
  if (button && circleX < width) { 
   incrX = 1 ;
  }else { 
   incrX = 0 ;
  }
  circleX = circleX + incrX;
}

void mousePressed(){
  
    button = !button;
}
