import peasy.*;
PeasyCam cam;

int textureW = 600;
int textureH = 600;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(210);
}

int cols = 5;
int rows = 5;
int boxW = textureW/cols;
int boxH = textureW/rows;
float count = 1;
int size = 50;
float x = 0;
float widthSize = size*(abs(x-mouseX)/width+0.1);
float heightSize = size*(abs(x-mouseY)/height+0.1);

void draw() {
  background(225);
 // noStroke();
 stroke(225);
  lights();
 
    for (x = 0; x < width; x += widthSize){
        widthSize = size*(abs(x-mouseX)/width*2+0.1);
        if(widthSize > size){
          widthSize = size;
        } 
        
        if(count % 2 == 0){
          fill(0,0,0);
          for(float y = 0; y < height; y += heightSize*2){
            heightSize = size*(abs(x-mouseY)/height*2+0.1);
            fill(255,255-frameCount%255,frameCount%255);
          
           // rect(x,y,widthSize, heightSize);
          }
        } else {
          for (float y = heightSize; y < height; y += heightSize*2){
            heightSize = size*(abs(x-mouseY)/height*2+0.1);
            fill(frameCount%255,255,255-frameCount%255);
            
            //rect(x,y,widthSize,heightSize);
          }
        } 
        count ++;
  }
  
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      pushMatrix();
      translate(i*boxW, j*boxH, random(boxW));
      box(boxW,  boxH, boxW);
      popMatrix();
    }
  }
}
void mousePressed(){
  if (mouseButton == RIGHT) {
    saveFrame("shuttle_texture_####.jpg");
  }
}
