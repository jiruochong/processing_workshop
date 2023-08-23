color c;
float lineLength = 0;
float angle = 2;
float angleSpeed = 3;
int dir = 1;
int count = 0;

void setup() {
  size(1000, 600);
  background(0);
  cursor(CROSS);
  strokeWeight(1);
  colorMode(HSB, 360, 100, 100, 100);
  angle = random(360);
  angleSpeed = random(0.5); 
  translate(width / 2, height / 2);
}

void draw() {
  float mx,my;
  for(int i = 0; i < 2; i++) {
    pushMatrix();
    float h = sin((float)frameCount / 1000) * 360 % 360;
    c = color(h, 40, 100, 10);
    if((i%2)==0) {
      mx = cos((float)frameCount / 200) * width / 4;
      my = sin((float)frameCount / 300) * height / 3;
      lineLength = sin((float)frameCount / 400) * 200;
    } else {
      my = cos((float)frameCount / 300) * height / 4;
      mx = sin((float)frameCount / 200) * width / 3;
      lineLength = cos((float)frameCount / 400) * 200;
    }
    translate(width / 2, height / 2);
    translate(mx, my); //<>//
    //else translate(my,mx);
    if((i%2)==0) {
      rotate(radians(angle*dir));
    } else {
      rotate(radians(angle*-dir));
    }
    stroke(c);
    line(0, 0, lineLength, 0);
    popMatrix();
  }
  angle += angleSpeed;
  if(angle >= 360) {
    angle = 0;
    dir = 0-dir;
    count++;
  }
  if(count > 2) {
    noLoop();
  }
  //String str = " count: " + count + "dir: "+dir+" angle: "+angle;
  //text(str, 10, 10);
}

void mousePressed() {
  //translate(mouseX, mouseY);
  //dir = 0-dir;
  count = 0;
  loop();
}
