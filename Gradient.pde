class Gradient {

  color c;


  Gradient() {
    colorMode(HSB, 255);
    c = color(random(255), 255, 255, 10);
  }

  void display(float x, float y) {
    for (int i=0; i<50; i++) {
      noStroke();
      fill(c);
      ellipseMode(CORNER);
      ellipse(x, y, i * 2, i * 2);
    }
  }
}