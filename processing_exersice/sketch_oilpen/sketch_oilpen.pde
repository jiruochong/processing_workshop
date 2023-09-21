void setup() {
  size(200, 200);
  strokeWeight(1);
  stroke(100,100,200,100);
}

void draw() {
  //background(204);
  if(mousePressed==true){
    float mouseSpeed = abs(mouseX - pmouseX);
    strokeWeight(1/mouseSpeed*10);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
