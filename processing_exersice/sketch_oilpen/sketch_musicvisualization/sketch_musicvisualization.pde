import ddf.minim.*;
Minim       minim;
AudioPlayer music;
float voice;
void  setup(){
  size(800,800, P3D);
  background(0);
  noStroke();
  stroke(255);
  minim = new Minim(this);
  music = minim.loadFile("/Users/jiruochong/Desktop/homework/charles333.mp3", 1024);
  music.loop();
}
void  draw()
{
  voice = music.mix.level();
   if (mousePressed) {
     pointLight(51, 102, 126, 35, 40, 36);
     directionalLight(159, 239, 255, 0, -1, -1);
     directionalLight(159, 239, 255, 0, -1, -1);
  }
    background(0);
    fill(200);
    translate(width/2, height/2, 0);
    sphere(voice*800);
    camera(mouseX, mouseY, mouseY / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
   // ellipse(width/2, height/2, voice*800,  voice*800); 
}
