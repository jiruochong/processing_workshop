import processing.pdf.*;

void setup() {
  //size(400, 400, PDF, "output-####.pdf");
  size(400, 400);
  stroke(255);
}

void draw() {
  line(150, 25, random(width), random(height));
  line(150, 25, mouseX, mouseY);
}

void mousePressed() {
  background(0, 47, 167);
}
