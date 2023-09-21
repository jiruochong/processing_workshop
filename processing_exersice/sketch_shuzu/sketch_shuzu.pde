int[] x = {
  50, 61, 83, 69, 71, 50, 29, 31, 17, 39
};
int[] gray = {
  250, 230, 200, 180, 150, 130, 110, 90, 60, 30
};
color[] c = {
  color(250,30,60),  color(180,90,60),  color(70,130,70),  color(50,190,60), 
  color(30,200,60),  color(60,250,100),  color(60,190,160),  color(60,160,190), 
  color(80,100,200),  color(30,50,250)
};
void setup() {
  size(100, 100);
  fill(0);
}

void draw() {
  // Read one array element each time through the for loop
  for (int i = 0; i < x.length; i++) {
    fill(c[i]);
    rect(0, i*10, x[i], 8);
  }
}
