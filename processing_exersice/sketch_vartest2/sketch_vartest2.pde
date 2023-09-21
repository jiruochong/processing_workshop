int circleSize = 0;
int circleX = 100;
int circleY = 100;
int step = 10;
int incrX = step;
int incrSize = step;


void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  stroke(255);
  fill(175);
  ellipse(circleX, circleY, circleSize, circleSize);
  
  
  
  if (circleX >= width){
      incrX = 0 - step;
  } else if (circleX <= 0){
      incrX = step;
  }
  circleX = circleX + incrX;
  
  if (circleSize >= width){
      incrSize = 0 - step;
  } else if (circleSize <= 0){
      incrSize = step;
  }
  circleSize = circleSize + incrSize;
}
