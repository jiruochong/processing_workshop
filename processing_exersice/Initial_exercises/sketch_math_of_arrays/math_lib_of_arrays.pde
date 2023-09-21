 // [0]  [1]   [2]  .................
 //{1,   5,    2, 9 , 8, 6 , 7}
 //  i = 0  minIndex = 0
 //{1,   5,    2, 9 , 8, 6 , 7}
 //  i = 1  minIndex = 2
 //{1,   2,    5, 9 , 8, 6 , 7}
 //  i = 2  minIndex = 3
 //{1,   2,    5, 9 , 8, 6 , 7}
 //  i = 3  minIndex = 5
 //{1,   2,    5, 6 , 8, 9 , 7}
void mySort(int[] score){
  for(int i = 0; i<score.length-1; i++){
    int minIndex = getMinIndexScoreByStartIToEnd(score,i);
    swap(score, i, minIndex);
  }
}

int getMinIndexScoreByStartIToEnd(int[] score, int startIndex){
  if (score.length==0){
    return startIndex;
  }
  int minIndex = startIndex;
  for (int i = startIndex; i < score.length; i++) {
     if(score[i] < score[minIndex]) {
       minIndex = i;
     }
  }
  return minIndex;
}


// [0]  [1]  [2]  .................
// {1,   5,   2,  9 , 8, 6 , 7}
// for(j = 0; j<score.length-1; j++){
//     for(i = 0; i<score.length-1; i++){
//        if (score[i] > socre[i+1]) then swap(score, i+1, i);
//     }
// }
// {1,   2,   5,   6, 7, 8, 9}
//int[] score3 = {81,50,40,90,73,60,30,20};
void myPopSort(int[] score){
  int endSwapIndex = score.length-1;
  for(int j = 0; j<score.length-1; j++){ 
     int flagSwap = 0;
     for(int i = 0; i<score.length-1-j; i++){
        if (score[i] < score[i+1]){
          swap(score, i+1, i);
          flagSwap = 1;
          endSwapIndex = i+1;
        }
     }
     //println(score);
     if (flagSwap == 0){
       return;
     }
  }
}

void myPop(int[] score){
   for(int i = 0; i<score.length-1; i++){
      if (score[i] < score[i+1]){
        swap(score, i+1, i);         
      }
   }
}

void myPopOneStep(int[] score, int i){   
    if (score[i] < score[i+1]){
      swap(score, i+1, i);         
    }   
}

//Exmple:
// int[] score1 = {12,39,84,0,90,10,-49,48};
// swap(score1, 0, 1);
// printArray(score1);

void swap(int[] score , int i , int j){
  if (i<0 || i>=score.length || j<0 || j>=score.length) return;
  int tmpi;
  tmpi = score[i];
  score[i] = score[j];
  score[j] = tmpi;
  return;
}

float getMinScore(int[] score) {
  if (score.length==0){
    return 0;
  }
  float record = score[0];
  for (int i = 0; i < score.length; i++) {
     if(score[i] < record) {
       record = score[i];
     }
  }
  return record;
}

float getMaxScore(int[] score) {
  if (score.length==0){
    return 0;
  }
  float record = score[0];
  for (int i = 0; i < score.length; i++) {
     if(score[i] > record) {
       record = score[i];
     }
  }
  return record;
}

float getSumScore(int[] score) {
  if (score.length==0){
    return 0;
  }
  float record = 0;
  for (int i = 0; i < score.length; i++){
     record = record + score[i] ;
  }
  return record;
}

float getAveScore(int[] score) {
  if (score.length==0){
    return 0;
  }
  return getSumScore(score)/score.length;
}

float getSquaScore(int[] score){
  if (score.length==0){
    return 0;
  }
  float record = 0;
  for (int i = 0; i < score.length; i++){
     record = record + score[i] * score[i] ;
  }
  if (score.length!=0){
    //record = record/score.length;
    //record = sqrt(record);
    //record = pow(record/score.length,1/2);
    //record = sqrt(record/score.length);
    record = pow(record/score.length,1.0/2);
  }
  return record;
}

float getHarmonicScore(int[] score){
  if (score.length==0){
    return 0;
  }
  float record = 0;
  for (int i = 0; i < score.length; i++){
    if (score[i]!=0){
      record = record +  (1.0 / score[i]) ;
    }
  }
  if (record!=0){
    record = score.length / record;
  }
  return record;
}
