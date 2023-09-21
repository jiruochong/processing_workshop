float[] data = { 19.0, 40.0, 75.0, 76.0, 90.0 };
float[] mydata = { 30.0, 58.0, 34.0 };

void halve(float[] d) {
  for (int i = 0; i < d.length; i++) { // For each array element,
    d[i] = d[i] / 2.0; // divide the value by 2
  }
}

void tri(float[] d) {
  for (int i = 0; i < d.length; i++) { // For each array element,
    d[i] = d[i] / 3.0; // divide the value by 3
  }
}

void setup() {
  halve(data);
  println(data[0]); // Prints "9.5"
  println(data[1]); // Prints "20.0"
  println(data[2]); // Prints "37.5"
  println(data[3]); // Prints "38.0"
  println(data[4]); // Prints "45.0"
  
  halve(mydata);
  println(mydata[0]); // Prints "15"
  println(mydata[1]); // Prints "29"
  println(mydata[2]); // Prints "17"
  
  tri(data);
  println(data[0]); // Prints "9.5"
  println(data[1]); // Prints "20.0"
  println(data[2]); // Prints "37.5"
  println(data[3]); // Prints "38.0"
  println(data[4]); // Prints "45.0"
  
  tri(mydata);
  println(mydata[0]); // Prints "15"
  println(mydata[1]); // Prints "29"
  println(mydata[2]); // Prints "17"
}
