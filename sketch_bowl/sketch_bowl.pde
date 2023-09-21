import peasy.*; 

PShape bowl;
PShape ball;
PImage iceTex;
PeasyCam cam;
void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(0);
  iceTex = loadImage("ice_texture.jpg");
  bowl = loadShape("Pottery_Bowl_Mesh.obj");
  bowl.setTexture(iceTex);
  bowl.scale(1000);
  bowl.rotateX(PI);
  ball = createShape(SPHERE,30);
  ball.setTexture(iceTex);
  ball.setStroke(0);
}
void draw() {  
  background(255);
  translate(width/2,height/2);
  lights();
  directionalLight(255,255,255,0,0,-1);
  directionalLight(255,255,255,0,-1,0);
  directionalLight(255,255,255,-1,0,0);
  pointLight(51, 102, 126, 35, 40, 36);
  shape(bowl);
  shape(ball,0,-100);
}
