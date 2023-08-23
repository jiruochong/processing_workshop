Car[] cars;

void setup() {
  //fullScreen(P3D);
  size(1600,900,P3D);
  noStroke();
  int numCars = height/(Car.carWidth*2); 
  cars = new Car[numCars];
  float hueStep = random(1,100);  // step size for the hue values
  float hue = 0;  // starting hue value
  for (int i = 0; i < cars.length; i++) {
    float y = random(-height/2, height*1.2);  // random y location along the y-axis
    // Create each object
    cars[i] = new Car(color(random(hue/3,10),random(hue/1.6,10),random(hue,255),255),0,y,random(5, 20));
    hue += hueStep;  // increment the hue value for the next iteration
    hue %= 360;  // reset the hue value to 0 if it is greater than 360
  }
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  translate(-width/10,-height/2);
  rotate(radians(400)); 
  for (int i=0; i < cars.length; i++){
    cars[i].drive();
    cars[i].display();
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
  static final int carLength = 7;

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    ispeed = xspeed = tempXspeed;
  }

  void display() {
    specular(255);  // set the specular color to white
    shininess(10);  // set the shininess to a medium value
    fill(c);  // set the fill color to the car's color
    fill(c);
    pushMatrix();
    translate(xpos, ypos, 0);  // move the sphere to its x and y position
    rotateX(radians(30 * sin(frameCount * 0.1)));  // rotate the sphere along the x-axis
    rotateY(radians(30 * sin(frameCount * 0.1)));  // rotate the sphere along the y-axis
    scale(1, 1, 2);  // stretch the sphere along the z-axis
    sphere(carLength / 2);  // draw the sphere
    popMatrix();
  }

  void drive() {
    xspeed = xspeed + acc + random(-1,1);
    xpos = xpos + xspeed;
    if (xpos > 2*width) {
      xpos = 0;
      xspeed = ispeed;
    }
  }
}
