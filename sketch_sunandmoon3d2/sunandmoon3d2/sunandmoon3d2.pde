float angle = 0;
float radius = 200;

void setup() {
  size(800, 500, P3D);
  noStroke();
}

void draw() {
  background(126);

  for (int i = 0; i < 2; i++) {
    fill(i == 0 ? 0 : 255, 150);
    float x, y;
    if (i == 0) {
      x = width/2 + radius * cos(angle);
      y = height/2 + radius * sin(angle);
    } else {
      x = width/2 - radius * cos(angle);
      y = height/2 - radius * sin(angle);
    }

    // Draw sphere
    pushMatrix();
    translate(x, y);
    rotateY(angle * (i == 0 ? 1 : -1));
    camera(x, y, y / tan(PI/6), x, height/2, 0, 0, 1, 0);
    translate(width/2, height/2, 0);
    sphere(100);
    popMatrix();
  }

  angle += 0.09;
}
