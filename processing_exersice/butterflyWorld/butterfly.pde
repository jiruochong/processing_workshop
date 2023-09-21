class Butterfly {
  static final int carWidth = 5;
  static final int carLength = 10;
  color c; 
  PVector acceleration;
  PVector velocity;
  PVector position;
  // Fitness and DNA
  float pollen;
  DNA dna;
  int geneCounter = 0;
  boolean hitTarget = false;   // Did I reach the target
    
  Butterfly(PVector initpos, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    position = initpos.get();
    dna = dna_;
  }
  
  void fly() {
    checkFlower(); // Check to see if we've reached the target
    if (!hitTarget) {
      applyForce(dna.genes[geneCounter]);
      geneCounter = (geneCounter + 1) % dna.genes.length;
      update();
    }
    display();
  }
  
  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    rectMode(CENTER);
    c = color(random(10,150),random(98,200),random(250,255),random(105,255));
    fill(c);
    ellipse(0-carLength/2, 0,random(carLength/2,carLength*2),random(carWidth/3,carWidth));
    ellipse(0+carLength/2, 0,random(carLength/2,carLength*2),random(carWidth/3,carWidth));
    popMatrix();
  }
  
  // Fitness function
  // fitness = one divided by distance squared
  void pollen() {
    float d = dist(position.x, position.y, flower.x, flower.y);
    pollen = pow(1/d, 2);
  }
  
  // Did I make it to the target?
  void checkFlower() {
    float d = dist(position.x, position.y, flower.x, flower.y);
    if (d < 12) {
      hitTarget = true;
    } 
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  float getPollen() {
    return pollen;
  }

  DNA getDNA() {
    return dna;
  }
}
