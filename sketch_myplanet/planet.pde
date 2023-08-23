class Planet {
  PVector pos;
  PVector vel;
  PVector acc;
  float radius;
  float mass;
  float r, g, b;
  int mod;
  PVector currVel;
  String name;
  ArrayList<PVector> posStore;
  float dis;
  int traillength;
  float rotation;
  float rot;
  float winkelPole;

  float Grav = 0.0002;

  PShape planet;

  Planet(String name, float dis, float incl, float winkelPole, float ecc, float r, float m, float re, float g, float b, int traillength, int mod, float rot, PImage img) {
    float vz;
    if (dis != 0) vz = sqrt((Grav * 333054) / dis);
    else vz = 0;
    vz = vz * (1 + (ecc/2));

    this.pos = new PVector(dis, 0, 0);
    this.vel = new PVector(0, 0, vz);
    this.pos.x = dis * cos(radians(incl));
    this.pos.y = (dis * sin(radians(incl))) *-1;
    float hyp = vz / cos(radians(incl));
    this.vel.y = sin(radians(incl)) * hyp;
    this.vel.setMag(vz*-1);

    this.winkelPole = winkelPole;
    this.rotation = rot;
    this.mod = mod;
    this.radius = r;
    this.mass = /*PI * sq(r)*/ m;
    this.r = re;
    this.g = g;
    this.b = b;
    this.currVel = new PVector(this.vel.x, this.vel.y, this.vel.z);
    this.name = name;
    this.traillength = traillength;

    this.posStore = new ArrayList<PVector>(traillength);
    for (int i = 0; i < traillength; i++) {
      posStore.add(new PVector(this.pos.x, this.pos.y, this.pos.z));
    }
    if (this.name == "Shuttle"){
      planet = loadShape("spaceshuttle_m.obj");
      planet.setTexture(img);
      planet.scale(50);
      planet.rotateX(PI);
      println("Shuttle");
    } else {
      planet = createShape(SPHERE, r);
      planet.setTexture(img);
      planet.setStroke(0);
    }
  }

  void grav(Planet planet1, ArrayList<Planet> planets) {
    for (Planet planet2 : planets) {
      if (planet1 == planet2) continue;
      PVector forceDir = PVector.sub(planet2.pos, planet1.pos); 
      float d = forceDir.magSq();
      forceDir.normalize();
      PVector f = forceDir.mult(Grav * planet2.mass / d);
      currVel = planet1.vel.add(f);
    }
  }

  void updateVel() {
    this.pos.add(this.currVel);
    if (frameCount % mod == 0) posStore.add(0, new PVector(this.pos.x, this.pos.y, this.pos.z));
    if ( posStore.size() > traillength) posStore.remove(traillength);
  }

  void updateVel1(int i) {
    this.pos.add(this.currVel);
    if (i % mod == 0) posStore.add(0, new PVector(this.pos.x, this.pos.y, this.pos.z));
    if ( posStore.size() > traillength) posStore.remove(traillength);
  }

  void show() {
    //for (int i = 0; i < posStore.size()-2; i++) {
    //  PVector p1 = posStore.get(i);
    //  PVector p2 = posStore.get(i+1);
    //  stroke(this.r, this.g, this.b);
    //  line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    //}

    noStroke();
    fill(r, g, b);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    if (rotation != 0) {
      if (rot > 1000000) rot = 0;
      rot = rot + (0.1 / rotation);
      rotateX(radians(winkelPole));
      rotateY(radians(rot));
    }
    //specular(r*1.5, g*1.5, b*1.5);     
    //shininess(5);
    //emissive(r*0.2, g*0.2, b*0.2);
    shape(planet);
    popMatrix();
  }

  void light(Planet plan) {
    lightSpecular(0, 0, 0);
    pointLight(120, 120, 110, plan.pos.x, plan.pos.y, plan.pos.z);
  }
}
