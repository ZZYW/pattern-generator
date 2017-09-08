

Gradient[] gradients;

void setup() {
  size(1000, 300);
  pixelDensity(2);
  gradients = new Gradient[10];
  for (int i=0; i<gradients.length; i++) {
    gradients[i] = new Gradient();
  }
}


void draw() {
  background(255);
  for (int i=0; i<gradients.length; i++) {
    gradients[i].display(i*100, 100);
  }
}