class MyTools {
  int textureW = 600;
  int textureH = 600;
  int boxW;
  int boxH;
  int gapSpace = 5;
  MyTools(int _textureW, int _textureH) {
    textureW = _textureW;
    textureH = _textureH;
  }
  void munsellColorSysCylinder() {
    colorMode(HSB, 255);
    translate(width/2, -height/2, 0);
    boxW = textureW/10;
    boxH = textureH/6;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int h = 0; h < 10; h++) {
      pushMatrix();
      rotateY(radians(map(h, 0, 10, 0, 360)));
      for(int b = 0; b < 10; b++) {
        for(int s = 0; s < 6; s++) {
          pushMatrix();
          translate(0, b*boxH + boxH/2, s * shapeSize);
          fill(map(h, 0, 10, 0, 255), map(s, 0, 5, 0, 255), map(b, 0, 10, 255, 0), 127);
          box(boxW-gapSpace + map(s,0, 5, -90,120), boxH-gapSpace, shapeSize-gapSpace);
          popMatrix();
        }
      }
      popMatrix();
    }
  }
  
  void munsellColorSys() {
    colorMode(HSB, 255);
    boxW = textureW/10;
    boxH = textureH/6;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int h = 0; h < 10; h++) {
      for(int s = 0; s < 6; s++) {
        for(int b = 0; b < 10; b++) {
          pushMatrix();
          translate(h*boxW + boxW/2, s*boxH + boxH/2, -b * shapeSize);
          fill(map(h, 0, 10, 255, 0), map(s, 0, 5, 255, 0), map(b, 0, 10, 255, 0), 102);
          box(boxW-gapSpace, boxH-gapSpace, shapeSize-gapSpace);
          popMatrix();
        }
      }
    }
  }
  
  void munsellColorSysCylinder(int hv, int bv, int sv) {
    colorMode(HSB, 255);
    translate(width/2, height/8, 0);
    boxW = textureW/hv;
    boxH = textureH/bv;
    int shapeSize = (boxW < boxH ? boxW : boxH);
    for(int h = 0; h < hv; h++) {
      pushMatrix();
      rotateY(radians(map(h, 0, hv, 0, 360)));
      for(int b = 0; b < bv; b++) {
        for(int s = 0; s < sv; s++) {
          pushMatrix();
          translate(0, b*boxH + boxH/2, s * shapeSize);
          fill(map(h, 0, hv, 0, 255), map(s, 0, sv, 0, 255), map(b, 0, bv, 255, 0),127);
          box(boxW-gapSpace + map(s,0, sv, -90,120), boxH-gapSpace, shapeSize-gapSpace);
          popMatrix();
        }
      }
      popMatrix();
    }
    
    if (true) {
      stroke(1);
      fill(0);
      line(0, -500, 0, 0, 1000, 0);  line(0, -500, 0, 10, -490, 0);line(0, -500, 0, -10, -490, 0);
      line(0, -100, 0, -1000, -100, 0);    line(-1000, -100, 0, -990, -90, 0);line(-1000, -100, 0, -990, -110, 0);
      pushMatrix();
      translate(0, 100, 0);
      rotateX(HALF_PI);
      noFill();
      circle(0, 0, 1500);
      float r = 1500/2;
      line(1500/2, 0, 1500/2-10, -10); line(1500/2, 0, 1500/2+10, -10);
      line(r*sin(30), r*cos(30), r*sin(30)-10, r*cos(30)-10); line(r*sin(30), r*cos(30), r*sin(30)+10, r*cos(30) -10);
      text("Hue", r+10, 100);
      popMatrix();
      
      fill(0, 408, 612);
      textSize(108);
      text("Brightness/Value", 10, -300);
      text("Saturation/Chroma", -900, -110);
      text("Hue", r+10, 100);
      noStroke();
    }
  }
  
  void displayVar(String inStr) {
    push();
    cam.beginHUD();
    fill(0, 408, 612);
    textSize(10);
    String str = " TW " + textureW + " TH " + textureH + " BW " + boxW + " BH " + boxH + " GAP " + gapSpace;
    text(str, 10, 10);
    text(inStr, 10, 20);
    cam.endHUD();
    pop();
  }
}
