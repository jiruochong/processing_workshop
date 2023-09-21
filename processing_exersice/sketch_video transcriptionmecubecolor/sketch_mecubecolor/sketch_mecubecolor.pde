import processing.video.*;

// Size of each cell in the grid, ratio of window size to video size
int videoScale = 16;
// Number of columns and rows in the system
int cols, rows;
// Variable to hold onto Capture object
Capture video;

void setup() {
  size(640, 480);
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  background(0);
  video = new Capture(this, cols, rows);
  video.start();
}

// Read image from the camera
void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      // Where are you, pixel-wise?
      //Iteration factor for coordinates
      int x = i*videoScale;
      int y = j*videoScale;
      color c = video.pixels[i + j*video.width];
      fill(c);
      stroke(0);
      rect(x, y, videoScale, videoScale);
    }
  }
}
