void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(0);
     stroke(0,0,255);
  } else {
    fill(random (255),0,0);
    stroke( 0,random (255),0);
  }
  rect (mouseX, mouseY, 80, 100, 7);
}
