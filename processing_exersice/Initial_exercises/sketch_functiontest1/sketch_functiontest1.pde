int add(int x , int y){
  return (x + y);
}

int sub(int x , int y){
  return (x - y);
}

int squresum(int x , int y){
  return (x*x + y*y);
}

void setup(){
  int z = add(1, 2);
  println(z);
  
  z = add(50000, 60000);
  println(z);
  
  z = sub(1, 2);
  println(z);
  
  z = sub(50000, 60000);
  println(z);
  
  z = squresum(2, 2);
  println(z);
  
  println("different or:" + (1^1) + (1^0) + (0^0));
  //z = squresum(50000, 60000);
  //println(z);
}
