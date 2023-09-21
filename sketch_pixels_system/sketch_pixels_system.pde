import java.util.Random;

ParticleSystem ps;
Random generator;
PVector pixVec;

PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cellsize1 = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
int threshold = 255;
int threshold1 = 150;
int threshold2 = 100;

void setup() {
  //size(647, 404, P3D);
  size(640, 360, P3D);
  img  = loadImage("8391638934996_.pic_hd.png"); // Load the image
  cols = width/cellsize1;             // Calculate # of columns
  rows = height/cellsize1;            // Calculate # of rows
  println(img.width, img.height);
  smooth();
  generator = new Random();
  ps = new ParticleSystem(0,new PVector(width/2,height-75),img);
}

void draw() {
  background(0);
  translate(0,0,0);
  if(mouseX >= (float)width/2){
    //rotateY((mouseX/width)*PI/2);
    rotateY(radians((mouseX/(float)width)*90));
  } else {
    //rotateY((mouseX/(width*2))*PI/2);
    rotateY(radians((mouseX/(float)width)*90));
  }
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize1 + cellsize1/2; // x position
      int y = j*cellsize1 + cellsize1/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float b = brightness(img.pixels[loc]);
      //float z = (abs(mouseX-(float)width/2)/((float)width/2)) * b - 100.0;
      float z = (mouseX/((float)width/2)) * b - 100.0;
      if( b <= threshold) {
        //Translate to the location, set fill and stroke, and draw the rect
        pushMatrix();
        translate(x,y,z);
        fill(c);
        noStroke();
        rectMode(CENTER);
        ellipse(0,0,cellsize1,cellsize1);
        popMatrix();
      }
    }
  }
  driveSystemRun();
}

void driveSystemRun(){
  float dx = map(mouseX,0,width,-0.2,0.2);
  PVector wind = new PVector(dx, 0, 0.5);
  ps.applyForce(wind);
  ps.run();
}

void mousePressed(){
  ps.destory();
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize1 + cellsize1/2; // x position
      int y = j*cellsize1 + cellsize1/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      float b = brightness(img.pixels[loc]);
      float z = (abs(mouseX-(float)width/2)/((float)width/2)) * b - 100.0;
      if(mouseX>=width/2 && b > threshold1) {
        pixVec = new PVector(x,y,z);
        ps.addParticle(new Particle(pixVec,c));
      }else if(mouseX<width/2 && b < threshold1 && b > threshold2) {
        pixVec = new PVector(x,y,z);
        ps.addParticle(new Particle(pixVec,c));
      }
    }
  }
}
