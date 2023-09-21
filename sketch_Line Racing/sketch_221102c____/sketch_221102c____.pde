//Car myCar1;
//Car myCar2; 
//Car myCar3; 
Car[] cars;
// Two objects!

void setup() {
  size(1500,500);
  noStroke();
  int numCars = 50; 
  cars = new Car[numCars];
  for (int i = 0; i < cars.length; i++) {
    float y = 10/2 + i*10;
    //float rate = random(2, 5);
    // Create each object
    cars[i] = new Car(color(random(10,150),random(98,200),random(250,255),random(105,255)),0,y,random(5, 10));
  }

  // Parameters go inside the parentheses when the object is constructed.
  //myCar1 = new Car(color(255,0,0),0,100,2);
  //myCar2 = new Car(color(0,0,255),0,10,5);
  //myCar3 = new Car(color(0,255,0),0,50,3);
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  //background(255);
  //rotate(radians(10)); 
  for (int i=0; i < cars.length; i++){
    cars[i].drive();
    cars[i].display();
  }
}

// Even though there are multiple objects, we still only need one class.
// No matter how many cookies we make, only one cookie cutter is needed.
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    //stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,20,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

void mousePressed() {
  saveFrame("mycars-######.png");
}
