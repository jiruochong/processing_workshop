PVector cameraLocation;
PVector sphereLocation;
PVector sphereLocation_1;
PVector iniCameraLocation;

void setup() {
  size(800, 600, P3D);
  cameraLocation = new PVector(0, 0, (height/2.0) / tan(PI*30.0 / 180.0));
  iniCameraLocation = cameraLocation;
  sphereLocation = new PVector(0, 0, 0);
  sphereLocation_1 = new PVector(0, 0, 0);
}

float circleAngle = 0;
float circleSize = 100;

void draw() {
  background(51);
  updateCameraLocation();
  translate(width/2, height/2, 0);
  // console logging camera location helps to conceptialize what's happening
  // console.log(`Camera: x:${cameraLocation.x}, y:${cameraLocation.y}, z:${cameraLocation.z}`)
  camera(cameraLocation.x, cameraLocation.y, cameraLocation.z, 0, 0, 0, 0, 1, 0);
  //normalMaterial();

  specular(255, 255, 255);
  box(50);
  
  circleAngle = circleAngle + 5;
  if(circleAngle > 1440)  circleAngle = 0;
  pushMatrix();
  sphereLocation.x = circleSize*cos(radians(circleAngle));
  sphereLocation.z = circleSize*sin(radians(circleAngle));
  translate(sphereLocation.x, sphereLocation.y, sphereLocation.z);
  specular(100, 100, 100);
  sphere(5);
  popMatrix();
  pushMatrix();
  sphereLocation_1.x = circleSize*2*cos(radians(circleAngle));
  sphereLocation_1.z = circleSize*2*sin(radians(circleAngle));
  translate(sphereLocation_1.x, sphereLocation_1.y, sphereLocation_1.z);
  specular(100, 100, 100);
  sphere(10);
  popMatrix();
}

void updateCameraLocation(){
  if (keyPressed) {
    if (keyCode == LEFT) cameraLocation.x -= 5;
    else if (keyCode == RIGHT) cameraLocation.x += 5;
    else if (keyCode == UP) cameraLocation.z -= 5;
    else if (keyCode == DOWN) cameraLocation.z += 5;
  }
  println(cameraLocation);
}

void keyPressed(){
  if (keyCode == 'S') cameraLocation = sphereLocation;
  else if (keyCode == 'W') cameraLocation = sphereLocation_1;
  else if (keyCode == 'Z') cameraLocation = iniCameraLocation;
  
}
