int lifetime;            // How long should each generation live
int lifeCounter;         // Timer for cycle of generation
Population population;   // Population
PVector flower;          // Flower position

void setup() {
  size(2040, 900);
  // The number of cycles we will allow a generation to live
  lifetime = height;
  // Initialize variables
  lifeCounter = 0;
  flower = new PVector(width/2, 24);
  // Create a population with a mutation rate, and population max
  float mutationRate = 0.01;
  population = new Population(mutationRate, 50);
}

void draw() {
  background(255);
  fill(color(#FCFC29),200);
  rectMode(CENTER);
  ellipse(flower.x,flower.y,12,24);// Draw the start and target positions
  ellipse(flower.x,flower.y,24,12);// Draw the start and target positions
  if (lifeCounter < lifetime) {  // If the generation hasn't ended yet
    population.live();
    lifeCounter++;
  } else {     // Otherwise a new generation
    lifeCounter = 0;
    population.pollen();
    population.selection();
    population.reproduction();
  }
  // Display some info
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifeCounter), 10, 36);
}

// Move the flower if the mouse is pressed，System will adapt to new target
void mousePressed() {
  flower.x = mouseX;
  flower.y = mouseY;
}
