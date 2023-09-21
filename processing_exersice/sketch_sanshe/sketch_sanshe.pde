PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(857, 557, P3D);
  img  = loadImage("/Users/jiruochong/Desktop/UAL/myprosessing/project/sketch_pimage1/redriversmall.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
  println(img.height, img.width);
}

void draw() {
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();//save
      translate(x,y,z);//move
      rotateY(radians(30));
      rotateZ(radians(30));
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();//back
    }
  }
}
