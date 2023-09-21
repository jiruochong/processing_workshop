class TreeLayer {
  PGraphics canvas;
  float minGroundHeight;
  float maxGroundHeight;
  int seed;
  float x;
  
  TreeLayer(int j,float minGroundHeight, float maxGroundHeight, float minTreeHeight, float maxTreeHeight, int numTrees){
    this.canvas = createGraphics(width,height);
    this.seed = 200*j;
    this.x = 0;
    
    this.minGroundHeight = minGroundHeight;
    this.maxGroundHeight = maxGroundHeight;
    
    this.canvas.beginDraw();
    this._drawGround(minGroundHeight, maxGroundHeight, this.seed);  
        
    //for(int i = 0; i < numTrees; i++) {
    //  // random height, bigger for foreground
    //  float h = random(minTreeHeight, maxTreeHeight);
    //  float x = random(width);
      
    //  float y = random(minGroundHeight-maxTreeHeight/2, this._groundHeight(x));
    //  pine(this.canvas, x, height-y, h/2, h);
    //  pine(this.canvas, x+width, height-y, h/2, h);
    //  pine(this.canvas, x-width, height-y, h/2, h);
    //}
    this.canvas.endDraw();
  }
  
  float _groundHeight(float x){
    //we want the height to be periodic
    float angle = TAU*x/width;
    float preHeight = noise(this.seed, (float)Math.cos(angle), (float)Math.sin(angle));
    return map(preHeight, 0,1, this.minGroundHeight, this.maxGroundHeight);
  }
  
  void _drawGround(float minHeight, float maxHeight, float seed){
    int resolution = 300;
    //draw ground
    this.canvas.beginShape();
    this.canvas.fill(220);
    this.canvas.noStroke();
    this.canvas.vertex(width,height);
    this.canvas.vertex(0,height);
    for (int i=0; i<=resolution; i++){
      float x = width*i/resolution;
      float h = height-this._groundHeight(x);
      this.canvas.vertex(x, h);
    }
    this.canvas.endShape(CLOSE);
  }
  
  void draw(){
    image(this.canvas,-this.x,0);
    image(this.canvas,width-this.x,0);
  }
  
  void update(float dx){
    this.x+=dx;
    if (this.x>width)
      this.x-=width;
  }
}

//draws a pine based at x,y with the given width and height w and h.
void  pine(PGraphics canvas,float x, float y, float w, float h) {
  canvas.push();
  canvas.translate(x,0);
  

  canvas.stroke(0, 20, 0);
  canvas.noFill();

  int y0 = (int)(y - h); //tree top
  canvas.strokeWeight(2.5);
  canvas.line(0, y, 0, y0);

  float di = random(1, 7);
  canvas.strokeWeight(1);
  for (int i = y0; i < y; i += di) {
    float l = map(i, y0, y, 0, w);
    branch(canvas, i, l);
  }
  
  canvas.pop();
}

void  branch(PGraphics canvas, float y, float l) {
  for (int i = 0; i < 10; i++) {
    float dy = random(-2, 5);
    float dl = random(1);
    canvas.bezier(- dl*0.50*l, y + dy,
           - dl*0.1*l, y,
           + dl*0.9*l, y,
           + dl*0.22*l, y + dy);
  }
}
