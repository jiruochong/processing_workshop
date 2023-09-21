color c;
float lineLength = 0;
float angle = 2;
float angleSpeed = 3;
int dir = 1;
int count = 0;
ArrayList<PVector> lines;

void setup() {
  size(1000, 600);
  background(0);
  cursor(CROSS);
  strokeWeight(3); // Increase stroke weight to make lines thicker
  colorMode(HSB, 360, 100, 100, 100);
  angle = random(360);
  angleSpeed = random(0.5); 
  translate(width / 2, height / 2);
  lines = new ArrayList<PVector>();
}

void draw() {
  float mx, my;
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    float h = sin((float)frameCount / 1000) * 360 % 360;
    c = color(h, 40, 100, 50); // Increase brightness to make it brighter
    if ((i%2) == 0) {
      mx = cos((float)frameCount / 200) * width / 2; // Increase width of horizontal lines
      my = sin((float)frameCount / 300) * height / 3;
      lineLength = sin((float)frameCount / 400) * 400; // Increase line length
    } else {
      my = cos((float)frameCount / 300) * height / 2; // Increase width of vertical lines
      mx = sin((float)frameCount / 200) * width / 3;
      lineLength = cos((float)frameCount / 400) * 400; // Increase line length
    }
    translate(width / 2, height / 2);
    translate(mx, my);
    if ((i%2) == 0) {
      rotate(radians(angle * dir));
    } else {
      rotate(radians(angle * -dir));
    }
    stroke(c);
    line(0, 0, lineLength, 0);
    popMatrix();
  }
  
  // Add current line to the list
  PVector currentLine = new PVector(lineLength, 0);
  lines.add(currentLine);
  
  // Display and fade out previous lines
  for (int i = 0; i < lines.size(); i++) {
    PVector line = lines.get(i);
    c = color(red(c), green(c), blue(c), alpha(c) - 1); // Reduce alpha to create fade-out effect
    stroke(c);
    line(line.x, line.y, line.x + 1, line.y); // Draw line segment
    line.x++; // Move line segment
    
    // Remove fully faded lines from the list
    if (alpha(c) <= 0) {
      lines.remove(i);
      i--; // Decrease index to account for removed element
    }
  }
  
  angle += angleSpeed;
  if (angle >= 360) {
    angle = 0;
    dir = 0 - dir;
    count++;
  }
  if (count > 2) {
    noLoop();
  }
}

void mousePressed() {
  count = 0;
  loop();
}
