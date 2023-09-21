//import codeanticode.syphon.*;
//SyphonServer server;

float angle = 4;
int numWave = 6;
Wave[] wave;  
void setup() {
  size(900, 900, P3D);
  background(255);
  colorMode(HSB, width);
   wave = new Wave[numWave];//初始化
  for (int i =0; i<numWave; i++)
  {
    wave[i] = new Wave();
  }
  //server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
 
   
  colorMode(RGB);
  noStroke();
  fill(0,frameCount % 50);
  rect(0, 0, 1800, 1800);

  
  pushMatrix();
    float col = random(400);
    noFill();
    strokeWeight(1);
    colorMode(HSB,400);
    stroke(col,400-col,400);
    translate(450, 450);
    rotate(sin( millis() * 500 ) * 3 );
    translate(100,0);
    rectMode(CENTER);
    rect(20,54,40,50);
    ellipse(0,0,400,400);
    translate(100,0);
    rect(20,54,40,50);
    ellipse(0,0,400,400);
    translate(-100,0);
    rect(20,54,40,50);
    ellipse(0,0,400,400);
  popMatrix();
  
   
  pushMatrix();
    translate(width / 2, height / 2, 0);
    rotate(radians(frameCount * 2 % 360));
    //pointLight(51, 102, 255, 35, 40, 36);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //noFill();
    stroke(255);
    sphere(80);
  popMatrix();
  
   pushMatrix();
    translate(width / 2, height / 2, 0);
    rotate(radians(frameCount * -2 % 360));
    //pointLight(51, 102, 255, 35, 40, 36);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //noFill();
    stroke(150);
    sphere(40);
  popMatrix();
  
  pushMatrix();
    translate(width / 2, height / 2, 0);
    rotate(radians(frameCount * -2 % 360));
    //pointLight(51, 102, 255, 35, 40, 36);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //directionalLight(159, 209, 255, 0, -1, -1);
    //noFill();
    stroke(20);
    sphere(20);
  popMatrix();
  
  noStroke();
  rect(0,0,width,height);
  angle += 0.01;
  
  translate(width / 2, height / 2);
  scale(0.2);
  for (int i = 0; i < width; i += 40) {
    for (int j = 0; j < height; j += 40) {
      rotate(-angle / 100);
    
      pushMatrix();
        strokeWeight(i / 60);
        stroke(255,10);
        fill(0, 0, 255);
        translate(i, j);
        rotate(angle * 5);
        scale(0.95);
        line(0, 0, 200, 200);
        noStroke();
        rect(0, 0, 20, 20);
        rect(200, 200, 20, 20);
        pushMatrix();
          for (int k = 0; k < width; k += 40) {
            noStroke();
            fill(255, 0, 0);
            translate(400, 400);
            rotate(-angle / 1);
            scale(0.95);
            rect(500, 100, 20, 20);
          }
        popMatrix();     
      popMatrix();
    }
  }
  
  

  translate(width , height);
  
  for (int i=0; i<numWave; i++)
  {
    wave[i].draw(); //绘制
  }

}
class Wave
{
  float offset; //偏移角度
  float offsetspeed; //偏移速度
  float waveheight; // 振幅
  float totallength; // 总长度
  float circlesize; //圆点大小
  Wave()//初始化，基本都是随机
  {
    offset = random(0,2);
    offsetspeed = random(0.01,0.02);
    waveheight = random(50,200);
    totallength = random(1,10) * TWO_PI;
    circlesize = random(2,4);
  }

  void draw()
  {
    for (float a=0; a< totallength; a+=0.1)//绘制时间间隔
    {
      float angle = a+offset;
      if (angle>totallength)//如果超过总长度，重新开始
        angle = angle - totallength;
      float x = map(angle,0,totallength,0,width)*noise(angle,a)*0.5;//将角度映射到X轴，并加入一定随机性
      float y = sin(angle) * waveheight;//当前的振幅
      noStroke();
      fill(255-255*(angle/totallength));//越偏离中心，颜色越浅
      pushMatrix();//变换坐标
      translate(width*0.5,height*0.5); // 将坐标原点换到画面中心
      rotate(angle); //旋转画布
      ellipse(x,y,circlesize,circlesize);//绘制点
      popMatrix();//释放

    }
    offset +=offsetspeed;
  }
  //server.sendScreen();
}
