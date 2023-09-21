void setup() {
  size(500, 500);
  fill(0, 47,167);
}
void draw() {
  rect(mouseX, mouseY, 30, 30);
}
void mousePressed() {
  saveFrame("bluerect-######.png");
  background(192, 64, 0);
}
