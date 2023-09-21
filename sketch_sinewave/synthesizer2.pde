import processing.sound.*;
class MySineWavesSynthsizer { 
  SinOsc[] sineWaves; // Array of sines
  float[] sineFreq; // Array of frequencies
  int numSines = 1; // Number of oscillators to use
  float detuneOffset = 0;
  int startHZ = 150;
  int diffHZ = 1000;
  
  MySineWavesSynthsizer() {
  }

  void init(PApplet parent, int needNumSines, float needDetuneOffset, int needStartHZ, int needDiffHZ) {
    numSines = needNumSines;
    detuneOffset = needDetuneOffset;
    startHZ = needStartHZ;
    diffHZ = needDiffHZ;
    sineWaves = new SinOsc[numSines]; // Initialize the oscillators
    sineFreq = new float[numSines]; // Initialize array for Frequencies
  
    for (int i = 0; i < numSines; i++) {
      // Calculate the amplitude for each oscillator
      float sineVolume = (1.0 / numSines) / (i + 1);
      // Create the oscillators
      sineWaves[i] = new SinOsc(parent);
      // Start Oscillators
      sineWaves[i].play();
      // Set the amplitudes for all oscillators
      sineWaves[i].amp(sineVolume);
    }
  }
  
  void play(int frequencyFactor, int maxFrequencyFactor, int detuneFactor, int maxdetuneFactor) {
    //Map mouseY from 0 to 1
    float yoffset = map(frequencyFactor, 0, maxFrequencyFactor, 0, 1);
    //Map mouseY logarithmically to 150 - 1150 to create a base frequency range
    float frequency = pow(diffHZ, yoffset) + startHZ;
    //Use mouseX mapped from -0.5 to 0.5 as a detune argument
    float detune = map(detuneFactor, 0, maxdetuneFactor, -detuneOffset, detuneOffset);
  
    for (int i = 0; i < numSines; i++) {
      sineFreq[i] = frequency * (i + 1 * detune);
      // Set the frequencies for all oscillators
      sineWaves[i].freq(sineFreq[i]);
    }
  }
}






class MyMidiSynthsizer {
  TriOsc triOsc;
  Env env;
  
  // Times and levels for the ASR envelope
  float attackTime = 0.001;
  float sustainTime = 0.004;
  float sustainLevel = 0.3;
  float releaseTime = 0.2;
  
  // This is an octave in MIDI notes.
  int[] midiSequence = { 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72 };
  
  // Play a new note every 200ms
  //int duration = 200;
  int duration = int((attackTime + sustainTime + releaseTime)*1000) + 30;
    
  
  // This variable stores the point in time when the next note should be triggered
  int trigger = millis();
  
  // An index to count up the notes
  int note = 0;
  
  void init(PApplet parent, float attackTime_, float sustainTime_, float sustainLevel_,  float releaseTime_ ) {
    attackTime = attackTime_;
    sustainTime = sustainTime_;
    sustainLevel = sustainLevel_;
    releaseTime = releaseTime_;
    duration = int((attackTime + sustainTime + releaseTime)*1000) + 30;
    // Create triangle wave and start it
    triOsc = new TriOsc(parent);
  
    // Create the envelope
    env = new Env(parent);
    
  }
  
  void play(int[] midiSequence_) {
    midiSequence = midiSequence_;
  
    // If the determined trigger moment in time matches up with the computer clock and
    // the sequence of notes hasn't been finished yet, the next note gets played.
    if ((millis() > trigger) && (note<midiSequence.length)) {
  
      // midiToFreq transforms the MIDI value into a frequency in Hz which we use to
      // control the triangle oscillator with an amplitute of 0.5
      triOsc.play(midiToFreq(midiSequence[note]), 0.5);
  
      // The envelope gets triggered with the oscillator as input and the times and
      // levels we defined earlier
      env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);

  
      // Create the new trigger according to predefined duration
      trigger = millis() + duration;

  
      // Advance by one note in the midiSequence;
      note++;
  
      // Loop the sequence, notice the jitter
      if (note == midiSequence.length) {
        note = 0;
      }
    }
  }
  
  // This helper function calculates the respective frequency of a MIDI note
  float midiToFreq(int note) {
    return (pow(2, ((note-69)/12.0))) * 440;
  }
}
