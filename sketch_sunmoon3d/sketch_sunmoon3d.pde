void setup() {
  size(800, 500, P3D);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  background(126);
  fill(255, 150);
  camera(x, y, y / tan(PI/6), x, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, 0);
  sphere(100);
  // ellipse(x, height/2, y, y);
  fill(0, 159);
  //ellipse(ix, height/2, iy, iy);
  camera(ix, iy, iy / tan(PI/6), ix, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, 0);
  sphere(100);
}
