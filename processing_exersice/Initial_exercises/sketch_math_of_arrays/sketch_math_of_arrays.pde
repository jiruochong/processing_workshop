int[] score1 = {12,39,84,0,90,10,-49,48};
int index = 0;
int[] score2 = {};
int[] score3 = {10,50,40,90,73,60,30,20};
 //<>// //<>//
void setup(){
  size(200,800);
  //testSuite1();
  //testSuite2();
  //testSuite3();
}

void draw() {
  background(255);
  fill(0, 5);
  rect(0, 0, width, height);
  myPopDisplay(score3);
}

void myPopDisplay(int[] score){
  float maxD = getMaxScore(score);
  float minD = getMinScore(score);
  for(int i = 0; i<score.length; i++){
    float ypos = map(i, 0, score.length-1, 0 + maxD/2, height - minD/2);
    float myColor = map(score[i], 0, getMaxScore(score), 128, 255);
    fill(myColor);
    ellipseMode(CENTER);
    ellipse(width/2, ypos, score[i], score[i]);
  }
}

void mousePressed() {
   //if(index < score3.length-1){
   //  myPopOneStep(score3,index);
   //  index++;
   //}else{
   //  index = 0;
   //}
   myPopSort(score3);
}

void testSuite3(){
  myPopSort(score3);
  printArray(score3);
}

void testSuite2(){
  //printArray(score1);
  swap(score1, 0, 1);
  swap(score1, 3, 5);
  swap(score2, 3, 5);
  printArray(score1);
}

void testSuite1(){
  
  float min = getMinScore(score1);
  println (min);
  
  float max = getMaxScore(score1);
  println (max);
  
  float sum = getSumScore(score1);
  println (sum);
  
  float ave = getAveScore(score1);
  println (ave);
  
  float squa = getSquaScore(score1);
  println (squa);
  
  float harmonic = getHarmonicScore(score1);
  println (harmonic);
  
  //min = getMinScore(score2);
  //println (min);
  
  //max = getMaxScore(score2);
  //println (max);
  
  //sum = getSumScore(score2);
  //println (sum);
  
  //ave = getAveScore(score2);
  //println (ave);
  
  //squa = getSquaScore(score2);
  //println (squa);
  
  //harmonic = getHarmonicScore(score2);
  //println (harmonic);
}
