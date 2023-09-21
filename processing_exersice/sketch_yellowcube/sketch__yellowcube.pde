size(200, 200);
// Before we deal with pixels
loadPixels();
// Loop through every pixel
for (int i = 0; i < pixels.length; i++) {
  // Pick a random number, 0 to 255
  //float rand = random(255);
  // Create a grayscale color based on random number
  color c = color(random(100,255),random(200,255),random(80.255),random(10,255));
  // Set pixel at that location to random color
  pixels[i] = c;
}
// When we are finished dealing with pixels
updatePixels();
