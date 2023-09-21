//https://openprocessing.org/sketch/1736643
//import processing.sound.*;

// Original snowy forest sketch by Barbara Almeida
// Scrolling version created by Ofir
ArrayList<TreeLayer> treeLayers;
//theta0;
//float stripHeight = 50;
//boolean haveSound = false;
int lapse = 0;    // mouse timer
boolean reverseParallax = false;
PShape sun;

//void preload(){
//  soundFormats("mp3");
//  sound = loadSound("./train.mp3"); 
//  sound.rate(1);
//}

void setup() {
  size(640, 360, P3D);
  noiseDetail(8, 0.5);
  
  int layers = 11;
  layers = 8;
  treeLayers = new ArrayList<TreeLayer>();
  //theta0 = random(TWO_PI);
  
  //create layers, starting from the layer in the background
  float treeHeight = height/180;
  float treeHeightDiff = height/60;
  for (int i=0; i<layers; i++){
    float p = (float)i/layers;
    //var canvas = createGraphics(width,height);
    float maxGroundHeight = (float)height*(0.75*(1-p)+0.33*p);
    float minGroundHeight = (float)height*(0.5*(1-p)+0.25*p);
    float minTreeHeight = treeHeight+treeHeightDiff*i;
    float maxTreeHeight = treeHeight+treeHeightDiff*(1+i);
    int numTrees = (int)(width*(maxGroundHeight-minGroundHeight)/(maxTreeHeight*maxTreeHeight));
    TreeLayer layer = new TreeLayer(i,
                              minGroundHeight, maxGroundHeight,   
                              minTreeHeight, maxTreeHeight, 
                              numTrees);         
    treeLayers.add(layer);
    println("layer:" + i + " maxGroundHeight:" + maxGroundHeight + " minGroundHeight:" + minGroundHeight);
  }
  sun = createShape(ELLIPSE, width*3/4, 60, 50, 50);
  frameRate(20);
}
color skyColor = color(50,50,128);
void mousePressed() { 
  //if (millis() - lapse > 200){
    if (mouseX < width/2){
      reverseParallax = !reverseParallax;
      //sun.setFill(color(230,100,0));
      //skyColor = color(149,25, 6);
   // } else {
      //sun.setFill(color(255,255,255));
      //skyColor = color(50,50,128);
    }
    return;
    //if (mouseX > width/2){
    //  if(sound.isPlaying() == false){
    //    sound.loop();
    //    loop();
    //  } else {
    //    sound.pause();
    //  }
    //}
  //}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == TAB) {
      save("snowy forest parallax.jpg");
    } else if (keyCode == UP) {
      sun.setFill(color(230,100,0));
      skyColor = color(149,25, 6);
    } else if (keyCode == DOWN) {
      sun.setFill(color(230,230,255));
      skyColor = color(50,50,128);
    }
  }
}

void draw() {
  //background(240);
  //noFill();
  float parallax = 5;
  //ambientLight(51, 102, 126);
  //pointLight(255,100,100, width*3/4, 100, -50);
  //pointLight(255,120,0, width*3/4, 100, 50);
  //pointLight(230,100,0, width*3/4+50, 100, 0);
  //pointLight(230,100,0, width*3/4-50, 100, 0);
  //pointLight(230,100,0, width*3/4, 100, 0);
  //sun.setFill(color(255,0,0), 100);
  //sun.setFill(color(255,100,0));
  //sun.setStroke(0);
  //sun.setStrokeWeight(0);
  //shape(sun, width*3/4, 100, 50, 50);
  for (TreeLayer treeLayer : treeLayers){
    fill(skyColor,100);
    rect(0,0, width, height);
    treeLayer.draw();
    treeLayer.update(parallax);
    parallax+=reverseParallax?-0.5:0.3;
  }
  fill(color(50,50,128),100);
  if (keyCode == UP) {
    fill(color(128,50,50),100);
  }
  rect(0,0, width, height);
  sun.setStrokeWeight(0);
  //sun.setFill(color(230,100,0));
  sun.setEmissive(color(230,100,0));
  //sun.setTexture(sunTexture);
  shape(sun);
}
