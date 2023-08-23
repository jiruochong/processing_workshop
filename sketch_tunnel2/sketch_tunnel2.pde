int z = 0;
int changeZ = 5;
final int Z_LIMIT = 640;

void setup() {
  size(640, 640, P3D);
  smooth();
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2, -100);
  if (z > Z_LIMIT || z < 0) {
    changeZ = -changeZ;
  }
  z += changeZ;
  camera(width/2, height/2, z/ tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  stroke(255);
  noFill();
  popMatrix();
  
  
  pushMatrix();
  translate(0, 0, z);
  translate(width/2, height/2, -100);
  box(200);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, z);
  translate(width/2, height/2, -100);
  sphere(100);
  popMatrix();
}
