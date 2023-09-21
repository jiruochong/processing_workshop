PImage img; // Declare a variable of type PImage

void setup() {
  size(320,240);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("./tint1.jpg");
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
 
  //translate(width/2,height/2);
  //rectMode(CENTER);
  tint(100);
  image(img,0,0);
  //image(img,0,0,width, height);
}
