float[] data = { 19.0, 40.0, 75.0, 76.0, 90.0 };
float[] mydata = { 30.0, 58.0, 34.0 };
float num1 = 12.0;
float num2 ;


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

float numhalf(float x) {
  return (x/2);
}

void setup() {
  num2 = numhalf(num1);
  println(num1);
  println(num2);
}
