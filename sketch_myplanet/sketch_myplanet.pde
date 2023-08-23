//https://discourse.processing.org/t/beginner-made-solar-system-3d-simulation/23551
import peasy.*; 

PShape sky;
PShape shuttleShape;
PImage skyTex;
PeasyCam cam;
ArrayList<Planet> planets;
float fmax = 0;
ArrayList<PVector> stars;
float rotate;
float radius = 250;
float camheight = 1000;
float fov;
float cameraZ;
float dis1;
int steps = 400000;

int p;

PImage sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto,mine, shuttle;

void setup() {
  size(800, 600, OPENGL);
  //fullScreen(OPENGL);
  frameRate(80);

  sun = loadImage("2k_sun.jpg");
  mercury = loadImage("2k_mercury.jpg");
  venus = loadImage("2k_venus.jpg");
  earth = loadImage("2k_earth.jpg");
  mars = loadImage("2k_mars.jpg");
  jupiter = loadImage("2k_jupiter.jpg");
  saturn = loadImage("2k_saturn.jpg");
  uranus = loadImage("2k_uranus.jpg");
  neptune = loadImage("2k_neptune.jpg");
  pluto = loadImage("pluto.jpg");
  mine = loadImage("2K_mine.jpg");
  shuttle = loadImage("spaceshuttle1.jpg");

  
  p = 0;

  fov = radians(70);

  perspective(fov, float(width)/float(height), 1, 9999999);

  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(21);

  skyTex = loadImage("2k_sky.jpg");
  sky = createShape(SPHERE, 500000);
  sky.setTexture(skyTex);
  sky.setStroke(0);  
  //shuttleShape = loadShape("spaceshuttle.obj");
  //shuttleShape.setTexture(shuttle);
  //shuttleShape.scale(50);
  
  planets = new ArrayList<Planet>();

  planets.add(new Planet("Sonne", 0, 0, 0, 0, 20, 333054, 255, 230, 0, 1, 1000, 0.1, sun));

  planets.add(new Planet("Merkur", 62.543, 7, 0, 0.205, 8, 0.055, 132, 132, 132, 45, 13, 10, mercury)); 
  planets.add(new Planet("Venus", 145.763, 3.4, 177, 0.007, 12, 0.8149, 197, 133, 40, 50, 28, 5, venus)); 
  planets.add(new Planet("Erde", 200, 0, 23.4, 0.017, 13, 1, 84, 101, 130, 50, 48, 0.1, earth));
  planets.add(new Planet("Mars", 280.9, 1.9, 6.7, 0.094, 9, 0.1069, 183, 99, 72, 60, 76, 0.1, mars)); 
  planets.add(new Planet("Jupiter", 1006.798, 1.3, 25.2, 0.049, 40, 317, 167, 161, 150, 80, 350, 0.05, jupiter)); 
  planets.add(new Planet("Saturn", 1839.02, 2.5, 3.1, 0.057, 32, 95, 208, 193, 163, 100, 700, 0.05, saturn)); 
  planets.add(new Planet("Uranus", 3727.1, 0.8, 26.7, 0.046, 60, 14, 155, 203, 210, 132, 1450, 0.07, uranus)); 
  planets.add(new Planet("Neptune", 6042.8, 1.8, 97.8, 0.011, 70, 17, 45, 52, 132, 183, 2000, 0.08, neptune)); 
  planets.add(new Planet("Pluto", 5032.3, 0, 0, 0, -0.19226, 0, 15, 0.10699933, 250, 200, 50, 0.08, pluto)); 
  planets.add(new Planet("mine",1106.798, 1.3, 25.2, 0.049, 40, 317, 167, 161, 150, 80, 350, 0.05, mine));
  planets.add(new Planet("Shuttle", 180, 0, 23.4, 0.017, 13, 1, 84, 101, 130, 50, 48, 0, shuttle));
 
  background(0);

  for (int i = 0; i < steps; i++) {
    pre(i);
  }
}

void draw() {  
  background(0);
  //pushMatrix();
  //translate(width/2, height/2, 0);
  //stroke(0, 0, 255);
  //line(300, 0, 0, -100, 0, 0);
  //stroke(0, 255, 0);
  //line(0, 330, 0, -0, -100, 0);
  //stroke(255, 0, 0);
  //line(0, 0, 300, 0, 0, -100);
  //popMatrix();

  float dis = (float) cam.getDistance();
  if (dis > 50000) dis = 50000;
  if (dis < 21) dis = 21;
  dis1 = map(dis, 21, 50000, 0, 255);
  fov = radians(log1(dis1));
  perspective(fov, float(width)/float(height), 1, 9999999);

  pushMatrix();
  float[] campos = cam.getPosition();
  translate(campos[0], campos[1], campos[2]);
  shape(sky);
  //translate(-campos[0], -campos[1], -campos[2]);
  popMatrix();

  for (Planet planet1 : planets) {
    planet1.grav(planet1, planets);
  }

  for (Planet planet1 : planets) {
    planet1.updateVel();
  }

  Planet plan = planets.get(0);
  Planet plan2 = planets.get(p);
  //camera(width/2, /*(height/2)*/ + map(mouseY, 0, height, -1000, 1000), 1000, width/2, height/2, 0, 0, 0, 1);

  pushMatrix();
  translate((width/2) - plan2.pos.x, (height/2) - plan2.pos.y, 0 - plan2.pos.z);
  for (int i = 0; i < planets.size(); i++) {
    Planet plan1 = planets.get(i);
    if (i != 0 && i > 10) plan1.light(plan);
    plan1.show();
  }
  popMatrix();
  
  cam.beginHUD(); 
  fill(255);
  text(plan2.name, 14, 14);
  cam.endHUD();
}

void pre(int i) {
  for (Planet planet1 : planets) {
    planet1.grav(planet1, planets);
  }

  for (Planet planet1 : planets) {
    planet1.updateVel1(i);
  }
}

float log1(float a) {
  float a2 = 2100 / (30 + 70 * exp(0.021 * -a));
  return a2;
}

void keyPressed() {
  if (key == 'w'){ 
    p++;
    if (p > planets.size()-1) p = 0;
  }
  if (key == 's'){ 
    p--;
    if (p < 0) p = planets.size()-1;
  }

}
