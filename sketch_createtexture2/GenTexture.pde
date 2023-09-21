class ClassTextureGen {
  //Constructors and class names with the same name
  int textureW = 600;
  int textureH = 600;
  int boxW;
  int boxH;
  int gapSpace = 5;
  
  ClassTextureGen(int _textureW, int _textureH, int _gapSpace) {
    //Initialize its own attributes
    textureW = _textureW;
    textureH = _textureH;
    gapSpace = _gapSpace;
    textureEnv();
    //setMaterials();
  }
  
  void textureEnv() {
    lightFalloff(1, 0.001, 0);
    ambientLight(255, 255, 255);
    //ambientLight(200, 127, 80);
    //shininess(30);
    noStroke();
  }
  
  void setPointLight() {
    float locX = mouseX - height / 2;
    float locY = mouseY - width / 2;
    pointLight(50, 50, 50, locX, locY, 1000);
  }
  
  void setMaterials() {
    ambient(0, 0, 250);
    shininess(0.5);
  }
  
  void boxMatrixGenerator(int cols, int rows) {
    boxW = textureW/cols;
    boxH = textureH/rows;
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        pushMatrix();
        translate(i*boxW + boxW/2, j*boxH + boxH/2, 0/*random(boxW)*/);
        fill(random(255), random(255), random(255), 150);
        box(boxW-gapSpace,  boxH-gapSpace, boxW-gapSpace);
        popMatrix();
      }
    }
  }
  
  //The method of class
  void box3DMatrixGenerator(int cols, int rows, int deps) {
    //setMaterials();
    boxW = textureW/cols;
    boxH = textureH/rows;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int i = 0; i < cols; i++) { //Iteration of columns
      for(int j = 0; j < rows; j++) { //Iteration of rows
        for(int k = 0; k < deps; k++) { //Iteration of depth
          //Iterate through each box
          pushMatrix();
          translate(i*boxW + boxW/2, j*boxH + boxH/2, k * shapeSize); //Move the origin of the coordinates to the center of each small box
          fill(random(255), random(255), random(255), 150); 
          //ambient(random(250), random(250), random(250));
          box(boxW-gapSpace, boxH-gapSpace, shapeSize-gapSpace);
          popMatrix();
        }
      }
    }
  }
    
  
  void sphereMatrixGenerator(int cols, int rows) {
    boxW = textureW/cols;
    boxH = textureH/rows;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        pushMatrix();
        translate(i*boxW + boxW/2, j*boxH + boxH/2, 0/*random(boxW)*/);
        fill(random(255), random(255), random(255), 150);
        sphere(shapeSize/2-gapSpace);
        popMatrix();
      }
    }
  }
  
  void sphere3DMatrixGenerator(int cols, int rows, int deps) {
    setMaterials();
    boxW = textureW/cols;
    boxH = textureH/rows;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        for(int k = 0; k < deps; k++) {
          pushMatrix();
          translate(i*boxW + boxW/2, j*boxH + boxH/2, k * shapeSize);
          fill(random(105), random(105), random(250), 102);
          //ambient(random(250), random(250), random(250));
          sphere(shapeSize/2-gapSpace);
          popMatrix();
        }
      }
    }
  }
}
