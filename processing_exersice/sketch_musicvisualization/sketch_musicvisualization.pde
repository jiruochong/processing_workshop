import ddf.minim.*;
import processing.sound.*;
Minim       minim;
AudioPlayer music;
float voice;

SoundFile song;
Waveform waveform;
int samples = 100;


void  setup(){
  size(800,800, P3D);
  background(0);
  noStroke();
  //stroke(255);
  minim = new Minim(this);
  music = minim.loadFile("/Users/jiruochong/Desktop/homework/charles333.mp3", 1024);
  music.loop();
  waveform = new Waveform(this,samples);
  waveform.input(song);
  colorMode(HSB,300);
}
void  draw()
{
  voice = music.mix.level();
 
    ambientLight(102, 102, 102);
    lightSpecular(204, 204, 204);
    directionalLight(102, 102, 102, 0, 0, -1);
    pointLight(51, 102, 126, 35, 40, 36);
    directionalLight(159, 239, 255, 0, -1, -1);
    directionalLight(159, 239, 255, 0, -1, -1);
  
  background(0);
  
  fill(0, 51, 102);
  pushMatrix();
  translate(width/2, height/2, 0);
  shininess(5.0);
  //specularMaterial(255);
  //shininess(300);
  sphere(voice*200);
 // camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  popMatrix();
 // ellipse(width/2, height/2, voice*800,  voice*800); 
 
 pushMatrix();
  translate(width/4, height/2, 0);
  shininess(5.0);
  //specularMaterial(255);
  //shininess(300);
  sphere(voice*200);
 // camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  popMatrix();
  
  pushMatrix();
  translate(width/1.33333, height/2, 0);
  shininess(5.0);
  //specularMaterial(255);
  //shininess(300);
  sphere(voice*200);
 // camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  popMatrix();
 
  pushMatrix();
  //translate(width/10, height/10, 0);
  fill(0,0,0,10);
  rect(0,0,width,height);
  strokeWeight(3);
  noStroke();
  waveform.analyze();
  printArray(waveform.data);
  beginShape();
    for(int i =0;i<samples;i++){
      float x = map(i,0,100,0,width);
      float y = map(waveform.data[i],-1,1,0,height);
      fill(y*200,200,100,20);
      vertex(x,y);
    }
    
     for(int i=width;i>0;i-=20){
        float n=noise(i*0.009,frameCount*0.09);
        float y=map(n,0,1,0,height);

        fill(n*200,200,200,120);
      
        vertex(i,y);
      }
  endShape();
  popMatrix();
}
