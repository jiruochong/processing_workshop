float angle = 0;
float radius = 200;
float sphereSize = 100;
float brightness = 126;

void setup() {
  size(800, 500, P3D);
  noStroke();
}

void draw() {
  background(brightness);

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
    sphere(sphereSize);
    popMatrix();
  }

  // Accelerate rotation and shrink spheres over 15 seconds
  float t = (millis() % 15000) / 15000.0;
  angle += t * 0.2;
  sphereSize = 100 * (1 - t);

  // Gradually reduce radius over 15 seconds
  radius = 200 * (1 - t);

  // Gradually brighten screen over 1 second
  brightness = 126 + t * 128;

  if (millis() >= 15000) {
    // End program after 15 seconds
    noLoop();
  }
}
