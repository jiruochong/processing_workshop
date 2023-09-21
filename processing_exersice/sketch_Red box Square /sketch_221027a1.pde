void setup () {

 size (500, 500);

 //background (50, 50, 50);

}



void draw() {

 stroke(random (200, 100), 0, 0);

 strokeWeight (5);

 rect(mouseX, mouseY, 50, 50);



 if (keyPressed) {

  strokeWeight (30);

  stroke (0, 0, random (200));

  rect(mouseX, mouseY, 50, 50);

 }

}
