int MASS_SIZE_RATE = 2;
 
class Mover {
    PVector pos;
    PVector last_pos;
    PVector vel;
    PVector acc = new PVector(0, 0);
    float mass;
  
    Mover(PVector init_pos, PVector init_vel, float mass) {
        pos = init_pos;
        last_pos = init_pos.copy();
        vel = init_vel;
        this.mass = mass;
    }
    
    void applyForce(PVector force) {
        acc.add(force.div(mass));
    }
 
    void update() {
        vel.add(acc);
        pos.add(vel);
        acc.x = 0;
        acc.y = 0;
    }
 
    void display() {
        stroke(0);
        // fill(175);
        // println(last_pos.x, last_pos.y, pos.x, pos.y);
        // ellipse(pos.x, pos.y, mass * MASS_SIZE_RATE, mass * MASS_SIZE_RATE);
        //float line_vel = vel.mag();
        //println(line_vel);
        line(last_pos.x, last_pos.y, pos.x, pos.y);
        last_pos.x = pos.x;
        last_pos.y = pos.y;
    }
}
 
class Attractor {
    PVector pos;
    float mass;
    float G;
  
    Attractor(PVector init_pos, float mass, float G) {
        pos = init_pos;
        this.mass = mass;
        this.G = G;
    }
 
    void display() {
        stroke(0);
        fill(255);
        ellipse(pos.x, pos.y, mass * MASS_SIZE_RATE, mass * MASS_SIZE_RATE);
    }
 
    PVector attract(Mover m) {
        PVector r = PVector.sub(pos, m.pos);
        float distance = r.mag();
        PVector direction = r.normalize();
        float f = (G * mass * m.mass) / (distance * distance);
        return direction.mult(f);
    }
}
 
Mover mover;
Mover myMover;
Attractor attr;
void setup() {
    fullScreen();
    background(255);
    PVector init_pos = new PVector(width/2 - 400, height/2);
    PVector init_vel = new PVector(1.5, 1);
    init_vel.mult(2);
    mover = new Mover(init_pos, init_vel, 1);
    PVector init_pos_1 = new PVector(width/2 - 400, height/2 - 100);
    PVector init_vel_1 = new PVector(1.6, 1);
    init_vel_1.mult(2);
    myMover = new Mover(init_pos_1,  init_vel_1, 1);
    PVector attr_pos = new PVector(width / 2, height / 2);
    attr = new Attractor(attr_pos, 10, 1000);
}
 
void draw() {
    PVector f = attr.attract(mover);
    mover.applyForce(f);
    mover.update();
    mover.display();
    
    PVector f_1 = attr.attract(myMover);
    myMover.applyForce(f_1);
    myMover.update();
    myMover.display();
    
    attr.display();
}
