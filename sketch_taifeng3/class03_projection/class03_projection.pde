//import codeanticode.syphon.*;
//SyphonServer server;

float angle=4;
  
void setup(){
  size(600,600, P3D);
  background(255);
  colorMode(HSB, width);
  //server = new SyphonServer(this, "Processing Syphon");

}
  
void draw(){
  noStroke();
  fill(0, 35, 45, 100);
  rect(0,0,width,height);
  
  angle += 0.01;
  
  translate(width/2,height/2);
  scale(0.2);
  for (int i=0; i<width; i+=40){
    for (int j=0; j<height; j+=40){
    rotate(-angle/100);
    
    pushMatrix();
    stroke(600,300);    
    strokeWeight(i/60); 
    fill(0);            
    translate(i,j);     
    rotate(angle*4);
    scale(0.95);
    line(0,0,600,600);  
    line(0,0,100,100); 
    noStroke();
    ellipse(30,30,30,20);
    ellipse(500,500,20,30); 
      pushMatrix();
      for (int k=0; k<width; k+=40){
        noStroke();
        fill(i,600,600);
        translate(600,600);
        rotate(-angle/1);
        scale(0.95);
        ellipse(400,100,20,20);
      }
      for (int k=0; k<width; k+=40){
        noStroke();
        fill(i,600,600);
        translate(600,600);
        rotate(-angle/1);
        scale(0.95);
        rect(900,100,20,20);
      }
      popMatrix();     
    popMatrix();
    }
  }
  
    //server.sendScreen();
}
