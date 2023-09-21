size(200, 200);
loadPixels();
// Loop through every pixel column
for (int x = 0; x < width; x++) {
  // Loop through every pixel row
  for (int y = 0; y < height; y++) {
    // Use the formula to find the 1D location
    int loc = x + y * width;
    //if (x % 2 == 0 && y % 2 == 0)
    if (x % 2 == 0 || y % 2 == 0) { // If we are an even column
      pixels[loc] = color(255);
    } else {          // If we are an odd column
      pixels[loc] = color(0);
    }
  }
}
updatePixels();
