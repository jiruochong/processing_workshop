// Step 1. Import the video library
import processing.video.*;

// Step 2. Declare a Capture object
Capture video;

void setup() {
  size(320, 240);

  // Step 3. Initialize Capture object via Constructor
  video = new Capture(this, 320, 240); //<>//
  this.
  video.start();
}

// An event for when a new frame is available
void captureEvent(Capture video) {
  // Step 4. Read the image from the camera.
  video.read();
}
void draw() {
  loadPixels();
  video.loadPixels();

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * video.width;

      // Get the red, green, blue values from a pixel
      float r = red  (video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue (video.pixels[loc]);

      // Calculate an amount to change brightness based on proximity to the mouse
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = map(d, 0, 100, 4, 0);
      r *= adjustbrightness;
      g *= adjustbrightness;
      b *= adjustbrightness;

      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
}
