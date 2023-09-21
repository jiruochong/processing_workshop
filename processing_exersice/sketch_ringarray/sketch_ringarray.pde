Ring[] rings; // Declare the array
int numRings = 50;
int currentRing = 0;
void setup() {
  size(100, 100);
  rings = new Ring[numRings]; // Create the array
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring(); // Create each object
  }
}
void draw() {
  background(0);
  for (int i = 0; i < rings.length; i++) {
    rings[i].grow();
    rings[i].display();
  }
}
// Click to create a new Ring
void mousePressed() {
  rings[currentRing].start(mouseX, mouseY, boolean(currentRing%2));
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
}
class Ring {
  float x, y;          // X-coordinate, y-coordinate
  float diameter;      // Diameter of the ring
  boolean on = false;  // Turns the display on and off
  boolean isCircle = true;

  void start(float xpos, float ypos, boolean isC) {
    
    isCircle = isC;
    x = xpos;
    y = ypos;

    diameter = 1;
    on = true;
  }

  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > 400) {
        on = false;
        diameter = 1;
      }
    }
  }

  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(204, 153);
      if (isCircle){
        ellipse(x, y, diameter, diameter);
      }else{
        ellipse(x, y, diameter/2, diameter);
      }
    }
  }
}
