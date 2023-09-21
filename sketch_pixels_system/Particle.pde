// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Simple Particle System

// A simple Particle class, renders the particle as an image
class Particle {
  PVector pos;
  PVector originPos;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;
  color c;

  Particle(PVector l,PImage img_) {
    acc = new PVector(0,0);
    float vx = (float) generator.nextGaussian()*0.3;
    float vy = (float) generator.nextGaussian()*0.3 - 1.0;
    vel = new PVector(vx,vy);
    originPos = pos = l.get();
    lifespan = 255.0;
    img = img_;
  }
  
  Particle(PVector l, color c_) {
    acc = new PVector(0,0);
    float vx = (float) generator.nextGaussian()*0.3;
    float vy = (float) generator.nextGaussian()*0.3 - 1.0;
    originPos = pos = l.get();
    vel  = new PVector(vx,vy);
    lifespan = 100.0;
    c = c_;
  }
  
  void reback(){
    pos = originPos;
  }
  void run() {
    update();
    render();
  }
  
  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  // Method to update position
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2.5;
    pos.x = constrain(pos.x, 50 , width-50);
    pos.y = constrain(pos.y, 50 , height-50);
    acc.mult(0); // clear Acceleration
  }

  // Method to display
  void render() {
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    //float a = map(lifespan, 0, 100, 100, 255);
    float a = lifespan;
    fill(c, a);
    noStroke();
    rectMode(CENTER);
    //sphere(cellsize);
    ellipse(0,0, cellsize,cellsize);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
