[![](https://img.shields.io/badge/Tool-Processing-4DCBEB?logo=processingfoundation)](https://processing.org/)
# processing_workshop
This is my prossesing workshop. Inside are some code for my generative artworks.

## What is Processing :
Processing is an open-source programming environment designed to facilitate visual arts, data visualization, and creative coding. It aims to help artists, designers, students, and programmers easily create interactive works. It can be used for creative coding, graphic design, animation, music composition, data visualization, and more.
Key features and uses include but are not limited to:
1. **Creative Coding**: Processing provides a simple and understandable programming syntax and functions that allow users to quickly realize their creative ideas.
2. **Graphics and Animation**: It can be used to create static images, animations, and interactive graphics. You can draw various geometric shapes, perform image processing, and create dynamic effects on the screen.
3. **Interaction Design**: Processing supports the creation of interactive works, such as responding to mouse, keyboard, or touch input.
4. **Music and Sound**: You can generate music, sound effects, and even synchronize them with graphics and animations using Processing.
5. **Education and Learning**: Processing is highly suitable for educational purposes, helping students understand basic programming concepts and creative expression.
In summary, Processing is a powerful tool used for creative expression and the realization of various art and tech projects.

**This is one of my examples of generative art works.**  
For example:

## project 1 ribbon line : 
The *sketch_ribbon_line* program output.
![185301695211390_ pic](https://github.com/jiruochong/processing_workshop/assets/142318719/f915631b-2a5a-4806-9710-7f42ebf05274)

**Content of the programme**
```
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
    translate(mx, my);
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
```
## project 2 create texture : 
The *sketch_createtexture* program output.
![export](https://github.com/jiruochong/processing_workshop/assets/142318719/7af6877c-befc-4379-a99a-d8e73708e82e)
![shuttle_texture_1558](https://github.com/jiruochong/processing_workshop/assets/142318719/16898646-6bdb-4365-b154-04b4d432a283)

**Content of the programme**
```
import gifAnimation.*;
import peasy.*;
PeasyCam cam;
GifMaker gifExport;

int textureW = 600;
int textureH = 600;

void setup() {
  size(600, 600, P3D);
  frameRate(12);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(210);
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);        // make it an "endless" animation
  gifExport.setTransparent(0,0,0);  // black is transparent
}

int cols = 20;
int rows = 60;
int boxW = textureW/cols;
int boxH = textureW/rows;
int frameSize = 2;
void draw() {
  background(255);
  lights();
  noStroke();
  //stroke(255);
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      pushMatrix();
      translate(i*boxW, j*boxH, random(boxW));
      fill(random(255), random(255), random(255),102);
      box(boxW-frameSize,  boxH-frameSize, boxW);
      popMatrix();
    }
  }
  //noLoop();
  gifExport.setDelay(1);
  gifExport.addFrame();
}
void mousePressed(){
  if (mouseButton == RIGHT) {
    saveFrame("shuttle_texture_####.jpg");
    gifExport.finish();  
  }
}
```

## project 3 ice voronoi : 

[Ice Voronoi](https://editor.p5js.org/kachakacha/full/7abchp3N0)

[![o3v9o-c2p3a](https://github.com/jiruochong/processing_workshop/assets/142318719/8a8b03fa-9ac9-4f4c-ad9e-119c2d133212)](https://editor.p5js.org/kachakacha/full/7abchp3N0)

This program of mine is saved in [p5.js](https://p5js.org/)

