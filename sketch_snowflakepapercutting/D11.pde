//PImage bluestar1; 
PImage bluestar2;
PImage bluestar3;
PImage bluestar4;
//PImage bluestar5;
PImage bluestar6;
PImage bluestar7;
PImage bluestar8;
int interval = 1000; // interval between updates in milliseconds
long lastUpdate = 0; // time of last update

void setup() {
  size(800, 800);
  //bluestar1 = loadImage("bluestar1.png");
  bluestar2 = loadImage("bluestar2.png");
  bluestar3 = loadImage("bluestar3.png");
  bluestar4 = loadImage("bluestar4.png");
 // bluestar5 = loadImage("bluestar5.png");
  bluestar6 = loadImage("bluestar6.png");
  bluestar7 = loadImage("bluestar7.png");
}

void draw() {
  smooth();
  // only update at a fixed interval
  if (millis() - lastUpdate > interval) {
    imageMode(CENTER);
    //float random1 = random(50, 400);
    //float randomX = random(0, 800);
    //float randomY = random(0, 800);

    float random2 = random(50, 300);
    float randomX2 = random(0, 800);
    float randomY2 = random(0, 800);

    float random3 = random(50, 51);
    float randomX3 = random(0, 800);
    float randomY3 = random(0, 800);

    float random4 = random(50, 55);
    float randomX4 = random(0, 800);
    float randomY4 = random(0, 800);

    //float random5 = random(100, 105);
    //float randomX5 = random(0, 800);
    //float randomY5 = random(0, 800);

    float random6 = random(100, 205);
    float randomX6 = random(0, 800);
    float randomY6 = random(0, 800);

    float random7 = random(40, 50);
    float randomX7 = random(0, 800);
    float randomY7 = random(0, 800);

   //image(bluestar1, randomX, randomY, random1, random1);
   image(bluestar2, randomX2, randomY2, random2, random2);
   image(bluestar3, randomX3, randomY3, random3 * 1.2, random3);
   image(bluestar4, randomX4, randomY4, random4 * 1.1, random4);
   // image(bluestar5, randomX5, randomY5, random5, random5);
   image(bluestar6, randomX6, randomY6, random6, random6);
   image(bluestar7, randomX7, randomY7, random7 * 1.1, random7);

    lastUpdate = millis();
  }
}
