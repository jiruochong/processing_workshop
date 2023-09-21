void setup() {
  //background colour
  background(255);  
  //app size
  size(500,500);
  //this is how fast the animation happens
  frameRate(200);
 
}

void draw() {
  //this randomises the stroke weight)
  strokeWeight(random(1,9));
  //this chooses the stroke colour or randomises it
  stroke(random(0),90);
  
  //this is to choose the fill colour for shapes
  fill(0,0,random(255));
  //theses are shapes with random position
   //this randomises the stroke weight)
  strokeWeight(random(1, 3));

  //this chooses the stroke colour or randomises it
  stroke(random(255), 0, 0);

  //this is to choose the fill colour for shapes

  //these are shapes with random position
  line(random(displayWidth), random(displayHeight), 340, 300);
  noStroke(); 
  ellipse(random(displayWidth), random(displayHeight), 1, 10);
  fill(#FFE633);
  ellipse(random(500),random(500),60,60);
}
