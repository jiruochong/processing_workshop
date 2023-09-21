class Population {

  float mutationRate;          // Mutation rate
  Butterfly[] population;         // Array to hold the current population
  ArrayList<Butterfly> matingPool;    // ArrayList which we will use for our "mating pool"
  int generations;             // Number of generations

   // Initialize the population
   Population(float m, int num) {
    mutationRate = m;
    population = new Butterfly[num];
    matingPool = new ArrayList<Butterfly>();
    generations = 0;
    //make a new set of creatures
    for (int i = 0; i < population.length; i++) {
      PVector position = new PVector(width/2,height+20);
      population[i] = new Butterfly(position, new DNA());
    }
  }

  void live () {
    // fly every butterfly
    for (int i = 0; i < population.length; i++) {
      population[i].fly();
    }
  }

  // Calculate pollen for each creature
  void pollen() {
    for (int i = 0; i < population.length; i++) {
      population[i].pollen();
    }
  }

  // Generate a mating pool
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxPollen = getMaxPollen();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getPollen(),0,maxPollen,0,1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  // Making the next generation
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      Butterfly mom = matingPool.get(m);
      Butterfly dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      PVector position = new PVector(width/2,height+20);
      population[i] = new Butterfly(position, child);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Find highest fintess for the population
  float getMaxPollen() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
       if(population[i].getPollen() > record) {
         record = population[i].getPollen();
       }
    }
    return record;
  }
}
