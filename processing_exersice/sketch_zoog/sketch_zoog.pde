void setup() {
  size(200,200);
  //fullScreen();
}

void draw() {
  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Draw Zoog's body  
  stroke(0);
  fill(150);
  rect(100,100,20,100);
  
  // Draw Zoog's heads
  fill(255);  
  ellipse(100,70,60,60);
  
  // Draw Zoog's eyes
  fill(0);  
  ellipse(81,70,16,32);
  ellipse(119,70,16,32);
  fill(220);
  ellipse(81+pmouseX%7,70+pmouseY%15,4,8);
  ellipse(119+mouseX%7,70+mouseY%15,4,8);
  
  // Draw Zoog's legs
  stroke(0);
  line(90,150,80,160);
  line(110,150,120,160);
  
}
