Car[] cars;

void setup() {
  //size(500,500);
  fullScreen();
  noStroke();
  int numCars = height/(Car.carWidth*2); 
  cars = new Car[numCars];
  for (int i = 0; i < cars.length; i++) {
    float y = Car.carWidth/2 + i*Car.carWidth;  // calc car's y location
    // Create each object
    cars[i] = new Car(color(random(10,150),random(98,200),random(250,255),random(105,255)),0,y,random(5, 10));
  }
}

void draw() {
  //background(255);
  fill(0, 5);
  rect(0, 0, width, height);
  translate(-width/10,-height/2);
  rotate(radians(30)); 
  for (int i=0; i < cars.length; i++){
    cars[i].drive();
    cars[i].displayRandomSize();
  }
}

class Car {
  color c;
  float xpos;
  float ypos;
  float ispeed;
  float xspeed;
  float acc = 0.1;
  static final int carWidth = 10;
  static final int carLength = 20;
  

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    ispeed = xspeed = tempXspeed;
  }

  void display() {
    //stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,carLength,carWidth);
  }
  
  void displayRandomSize() {
    //stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,random(carLength/2,carLength*2),random(carWidth/3,carWidth));
  }

  void drive() {
    //xspeed = xspeed + xspeed*random(0.1,acc);
    //xspeed = xspeed + random(0.1,acc);
    xspeed = xspeed + acc;
    xpos = xpos + xspeed;
    if (xpos > 2*width) {
      xpos = 0;
      xspeed = ispeed;
    }
  }
}

//void mousePressed() {
//  saveFrame("mycars-######.png");
//}
