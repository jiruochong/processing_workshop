// Declare Mover object
Mover mover;
Mover[] movers = new Mover[20];
PImage img;
ArrayList<PVector> trail = new ArrayList<PVector>();

void setup() {
  size(1650,800);
  noStroke();
  smooth();
  img = loadImage("loonglin6.png");
  img = loadImage("loonglin4.png");
  background(255);
  // Make Mover object
  mover = new Mover();
 
   for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  //background(0);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
   for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  
  trail.add(new PVector(mouseX, mouseY));

  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display();
   if (trail.size() > 25) {
    trail.remove(0);
  }

  // Draw the trail
  //for (int i = 0; i < trail.size(); i++) {
  //  PVector p = trail.get(i);

  //  // The trail is smaller at the beginning,
  //  // and larger closer to the mouse
  //  float size = 50.0 * i / trail.size();
  //  ellipse(p.x, p.y, size, size);
  //}
}

class Mover {

  PVector location;
  PVector velocity;
  // Acceleration is the key!
  PVector acceleration;
  // The variable, topspeed, will limit the magnitude of velocity.
  float topspeed;


  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    topspeed = 19;
  }

  void update() {

    acceleration = new PVector(random(-1,1),random(-1,1));
    acceleration.normalize();

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(105,205,225,175);
    image(img,location.x,location.y);
    ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}
