int x = 0;

void setup() {
  
  size (500,500);
  
}

void draw() {
  frameRate(12);
  background(50);
  fill(255);
  noStroke();
  
  for (int i = 0; i < 10; i++) {
    
   ellipse (random(width), random(height),20,20);
  }
}
