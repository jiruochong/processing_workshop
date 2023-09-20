import gifAnimation.*;
import peasy.*;
PeasyCam cam;
GifMaker gifExport;

int textureW = 600;
int textureH = 600;

void setup() {
  size(600, 600, P3D);
  frameRate(12);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(210);
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);        // make it an "endless" animation
  gifExport.setTransparent(0,0,0);  // black is transparent
}

int cols = 20;
int rows = 60;
int boxW = textureW/cols;
int boxH = textureW/rows;
int frameSize = 2;
void draw() {
  background(255);
  lights();
  noStroke();
  //stroke(255);
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      pushMatrix();
      translate(i*boxW, j*boxH, random(boxW));
      fill(random(255), random(255), random(255),102);
      box(boxW-frameSize,  boxH-frameSize, boxW);
      popMatrix();
    }
  }
  //noLoop();
  gifExport.setDelay(1);
  gifExport.addFrame();
}
void mousePressed(){
  if (mouseButton == RIGHT) {
    saveFrame("shuttle_texture_####.jpg");
    gifExport.finish();  
  }
}
