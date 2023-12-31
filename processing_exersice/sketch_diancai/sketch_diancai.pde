PImage img;
int pointillize = 16;

void setup() {
  size(200,200);
  img = loadImage("/Users/jiruochong/Desktop/UAL/myprosessing/project/sketch_pimage1/tint1.jpg");
  background(0);
  smooth();
}
int caLocation(int x, int y, int imgW){
 return x + y*imgW;
}

void draw() {
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = caLocation (x, y, img.width);

  // Look up the RGB color in the source image
  //loadPixels();
  //float r = red(img.pixels[loc]);
  //float g = green(img.pixels[loc]);
  //float b = blue(img.pixels[loc]);
  //color c = img.pixels[loc];
  noStroke();

  // Draw an ellipse at that location with that color
  fill(img.pixels[loc],100);
  ellipse(x,y,pointillize,pointillize);
}
