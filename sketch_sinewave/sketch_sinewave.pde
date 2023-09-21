MySineWavesSynthsizer mySineWavesSythsizer = new MySineWavesSynthsizer();
//MySineWavesSynthsizer mySineWavesSythsizer2 = new MySineWavesSynthsizer();
MyMidiSynthsizer myMidiSynthsizer = new MyMidiSynthsizer();
//CDEFGAB
int[] midiSequence = { 72, 74, 76, 77, 79, 81, 83, 84, 86, 88, 89, 91, 93 };

void setup() {
  size(640, 360);
  background(255);
  //mySineWavesSythsizer.init(this, 10, 1, 200, 2000);
  //mySineWavesSythsizer2.init(this, 6, 0.5, 150, 1000);
  myMidiSynthsizer.init(this, 0.001, 0.001, 0.1, 0.1 );
}

void draw() {
  //mySineWavesSythsizer.play(mouseY,height, mouseX, width);
  //mySineWavesSythsizer2.play(mouseY,height, mouseX, width);
  myMidiSynthsizer.play(midiSequence);
}
