import peasy.*;
PeasyCam cam;
ClassTextureGen gen;
MyTools tool;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(210);
  gen = new ClassTextureGen(width, height, 10);  //call constructing functions
  tool = new MyTools(1000, 600);
}

void draw() {
  background(255);
  //lights();
  //gen.setPointLight();
  //gen.boxMatrixGenerator(10, 10);
  //gen.sphere3DMatrixGenerator(5, 10, 5);
   gen.box3DMatrixGenerator(5, 5, 5); //texture generation
  //gen.munsellColorSysCylinder(); //texture generation
  //tool.munsellColorSysCylinder(20,15,10); 
  //tool.displayVar("");
}

void mousePressed(){
  if (mouseButton == RIGHT) {
    saveFrame("texture_####.jpg");
  }
  if (mouseButton == LEFT) {
    background(255);
  }
}
