ArrayList<Dot> poop = new ArrayList();
int minR=40, maxR=600, N=48 ;
void setup() {
  size(1000, 1000);
  for (int n=0; n<N; n++) { 
    float R = map(n, 0, N, minR, maxR);
    poop.add(new Dot(R, n));
  }
} 
void draw() {
  background(10); 
  translate(width/2, height/2);  
  for (int i=0; i<poop.size (); i++) {
    Dot D = poop.get(i);
    D.show();
    D.R+=0.6f;
    if (D.R >maxR) {
      D.R =minR;
    }
  }
}
class Dot {
  float R ;
  color[] colors;
  int N;
  Dot(float R, int N) { 
    this.R = R;
    this.N = N;
  }
  void show() { 
    noStroke();
    for (int i=0; i<360; i+=3) {
      float x = R*sin(radians(i+N*5));
      float y = R*cos(radians(i+N*5));
      float t = map(R, minR, maxR, -180, 180);
      float r = 6*sin(radians(t));
      fill(200-(x/2), 200+(x/2), 200-(y/2)); 
      //ellipse(x, y, 2*r, 2*r);
      
        ellipse(x/2, y/2, .9*r, .9*r);
      
           //ellipse(x/4, y/4, .3*r, .3*r);
    }
  }
}
