int circleSize = 200;
int circleX = width/2;
int circleY = height/2;
//int circleZ = 100;
float circleAngle = 0;
int step = 20;
int incrX = step;
int incrY = step;
int incrSize = step;

void setup() {
  size(800, 800, P3D);
  stroke(255);
}

/*
void draw() {
  //background(0);
  if (mousePressed) {
    directionalLight(255, 255, 255, 0, -1, 0);
    directionalLight(20, 20, 20, 0, -1, 0);
    
    directionalLight(0, 255, 0, 0, 1, 0);
    directionalLight(0, 0, 255, 0, 1, 0);
    directionalLight(100, 100, 100, 0, 1, 0);
    
    ambientLight(51, 102, 255);
    spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
    spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  }
  fill(0, 12);
  pushMatrix();
  translate(width/2, height/2, 0);
  rectMode(CENTER);
  rect(0, 0, width*3, height*3);
  popMatrix();
  fill(200);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  sphere(100);
  noFill();
  popMatrix();
  camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  translate(width/2, height/2, 0);
  float noiseScale = 0.006;
  float noiseAngleX = noise(frameCount * noiseScale) * TWO_PI;
  float noiseAngleY = noise(frameCount * noiseScale + 100) * TWO_PI;
  float noiseAngleZ = noise(frameCount * noiseScale + 200) * TWO_PI;
  
  pushMatrix();
  rotateX(noiseAngleX);
  rotateY(noiseAngleY);
  rotateZ(noiseAngleZ);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();
  
  pushMatrix();
  rotateY(noiseAngleY);
  rotateX(noiseAngleX);
  rotateZ(noiseAngleZ);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();
  
  pushMatrix();
  rotateX(noiseAngleX);
  rotateY(noiseAngleY);
  rotateZ(noiseAngleZ);
  ellipse(0, 0, 400, 400);
  popMatrix();
  
  pushMatrix();
  rotateY(noiseAngleY);
  rotateX(noiseAngleX);
  rotateZ(noiseAngleZ);
  ellipse(0, 0, 400, 400);
  popMatrix();

  pushMatrix();
  rotateY(radians(circleAngle));
  circleAngle += 0.5;
  ellipseMode(RADIUS);
  //float noiseScale1 = 0.01;
  //float noiseAngle1 = noise(frameCount * noiseScale1) * TWO_PI;
  //rotate(noiseAngle1);
  //ellipse(0, 0, circleSize, circleSize);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();
  
  pushMatrix();
  rotateY(radians(circleAngle));
  rotateX(radians(circleAngle));
  circleAngle += 0.2;
  ellipseMode(RADIUS);
  //float noiseScale2 = 0.01;
  //float noiseAngle2 = noise(frameCount * noiseScale2) * TWO_PI;
  //rotate(noiseAngle2);
  //ellipse(0, 0, circleSize, circleSize);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();
  
  pushMatrix();
  rotateX(radians(circleAngle));
  rotateY(radians(circleAngle));
  circleAngle += 0.5;
  ellipseMode(RADIUS);
  //float noiseScale3 = 0.05;
  //float noiseAngle3 = noise(frameCount * noiseScale3) * TWO_PI;
  //rotate(noiseAngle3);
  //ellipse(0, 0, circleSize, circleSize);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();
  
  pushMatrix();
  rotateX(radians(circleAngle));
  circleAngle += 0.2;
  ellipseMode(RADIUS);
  //float noiseScale4 = 0.09;
  //float noiseAngle4 = noise(frameCount * noiseScale4) * TWO_PI;
  //rotate(noiseAngle4);
  //ellipse(0, 0, circleSize, circleSize);
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();

  
  pushMatrix();
  rotateX(radians(circleAngle));
  rotateY(radians(circleAngle));
  rotateZ(radians(circleAngle));
  circleAngle += 0.1;
  ellipseMode(RADIUS);
  ellipse(0, 0, 400, 400);
  popMatrix();

  
  pushMatrix();
  rotateY(radians(circleAngle));
  rotateX(radians(circleAngle));
  rotateZ(radians(circleAngle));
  circleAngle += 0.2;
  ellipseMode(RADIUS);
  ellipse(0, 0, 400, 400);
  popMatrix();
  
 
  
  //if (circleX >= width){
  //    incrX = 0 - step;
  //} else if (circleX <= 0){
  //    incrX = step;
  //}
  //circleX = circleX + incrX;
  
  //if (circleSize >= width){
  //    incrSize = 0 - step;
  //} else if (circleSize <= 0){
  //    incrSize = step;
  //}
  //circleSize = circleSize + incrSize;
   
  //if (circleSize >= height){
  //    incrSize = 0 - step;
  //} else if (circleSize <= 0){
  //    incrSize = step;
  //}
  //circleSize = circleY + incrY;
  
  //if (circleSize >= height){
  //    incrSize = 0 - step;
  //} else if (circleSize <= 0){
  //    incrSize = step;
  //}
  //circleSize = circleSize + incrSize;
}
*/

void draw() {
  //background(0);
  if (mousePressed) {
    directionalLight(255, 255, 255, 0, -1, 0);
    directionalLight(20, 20, 20, 0, -1, 0);
    
    directionalLight(0, 255, 0, 0, 1, 0);
    directionalLight(0, 0, 255, 0, 1, 0);
    directionalLight(100, 100, 100, 0, 1, 0);
    
    ambientLight(51, 102, 255);
    spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
    spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  }
  fill(0, 12);
  pushMatrix();
  translate(width/2, height/2, 0);
  rectMode(CENTER);
  rect(0, 0, width*4, height*4);
  popMatrix();
  fill(200);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  noStroke();
  sphere(50);
  noFill();
  popMatrix();
  camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);

  translate(width/2, height/2, 0);
  float noiseScale = 0.006;
  circleSize = 200;
  if (circleAngle > 1440){
    circleAngle = 0;
  }
  for (int i = 0; i < 2; i = i+1) {
    circleSize = circleSize*(i+1);
    for (int j = 0; j < 5; j = j+1) {
      pushMatrix();
      float noiseAngleX = noise(frameCount * noiseScale) * TWO_PI;
      float noiseAngleY = noise(frameCount * noiseScale + 100) * TWO_PI;
      float noiseAngleZ = noise(frameCount * noiseScale + 200) * TWO_PI;
      circleAngle += random(0.5,5);
      rotateX(radians(noiseAngleX + circleAngle));
      circleAngle += random(0.5,5);
      rotateY(radians(noiseAngleY + circleAngle));
      circleAngle += random(0.5,5);
      rotateZ(radians(noiseAngleZ + circleAngle));
      ellipseMode(RADIUS);
      ellipse(0, 0, circleSize, circleSize);
      stroke(255, 255, 255);
      popMatrix();
    }
  }
}


 
