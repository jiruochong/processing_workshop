void setup() {
  size(1000, 500, P3D);
  noStroke();
  sphereDetail(20);
  fill(20, 40, 100);
}
void draw() {
  lights();
  background(0);
  translate(width / 3, height / 3, -200); 
  rotateZ(map(mouseX+mouseY, 0, width+height, 0, TWO_PI));
  rotateY(map(mouseY, 0, height, 0, TWO_PI));
  rotateX(map(mouseX, 0, width, 0, TWO_PI));
  for (int y = 0; y < 5; y=y+1) {
      pushMatrix(); // xyz at that time push stack
      translate(120, 120*y, -120); // change y
      if(y==0){fill(200,20,40);}
      if(y==1){fill(#FFF52C);}
      if(y==2){fill(#43FF6D);}
      if(y==3){fill(#79FFE7);}
      if(y==4){fill(#3C4CED);}
      sphere(30); // draw ball
      popMatrix(); // recover last stack
  }
}
void mousePressed() {
  saveFrame("ballfive-######.png");
}
