float[] sineWave;

void setup() {
  size(200, 200);
  sineWave = new float[width];
  for (int i = 0; i < sineWave.length; i++) {
    // Fill array with values from sin()
    float r = map(i, 0, width, 0, TWO_PI);
    sineWave[i] = abs(sin(r));
  }
}

void draw() {
  for (int i = 0; i < sineWave.length; i++) {
    // Set stroke values to numbers read from array
    //stroke(sineWave[i] * 255);
    float g = map(sineWave[i], 0, 1, 0, 255);
    stroke(g);
    line(i, 0, i, height);
  }
}
