PImage img;

void setup() {
  size(200, 200);
  //img = loadImage("/Users/jiruochong/Desktop/UAL/myprosessing/project/sketch_pimage1/tint1.jpg");
  img = loadImage("../sketch_pimage1/tint1.jpg");
}

void draw() {
  loadPixels();
  // Since we are going to access the image's pixels too
  img.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here,
      // before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] =  color(r,g,b);
    }
  }
  updatePixels();
}
