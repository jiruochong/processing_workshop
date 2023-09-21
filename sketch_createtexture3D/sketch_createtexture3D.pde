import peasy.*;
PeasyCam cam;

int textureW = 600;
int textureH = 600;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(210);
  frameRate(1);
}

int cols = 5;
int rows = 5;
int lays = 5;
int boxW = textureW/cols;
int boxH = textureW/rows;
int boxL = textureW/lays;

void draw() {
  //background(255);
  lights();
  for(int i = 0; i < cols; i++) {
    //rotateX(radians(TAU/(i+1)));
    for(int j = 0; j < rows; j++) {
      //rotateY(radians(TAU/(j+1)));
      for(int k = 0; k < lays; k++) {     
        //rotateZ(radians(TAU/(k+1)));
        pushMatrix();
        translate(i*boxW, j*boxH, k*boxL);
        box(random(boxW-1), random(boxH-1), random(boxL-1));
        popMatrix();
      }
    }
  }
}
void keyPressed(){
  if (keyCode == 'S') {
    noLoop();
  } else if  (keyCode == 'R') {
    loop();
  }
}
void mousePressed(){
  if (mouseButton == RIGHT) {
    saveFrame("shuttle_texture_####.jpg");
  }
  if (mouseButton == LEFT) {
    background(255);
  }
}
