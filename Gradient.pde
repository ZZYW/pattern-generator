class Gradient {

  PVector loc;
  PVector size;
  ColorScheme myColors;
  PVector movingDir;

  float rotateAngle;

  float ns1, ns2, ns3, ns4;

  Gradient(int x, int y, int w, int h) {
    colorMode(HSB, 255);
    myColors = allColorSchemes.get(floor(random(allColorSchemes.size())));
    for (int i=0; i<myColors.colors.length; i++) {
       myColors.colors[i] = color( hue(myColors.colors[i]), saturation(myColors.colors[i]) * 1.5 , brightness(myColors.colors[i]), 5);
     // myColors.colors[i] = color(random(0, 255), 255, 255, 10);
    }
    myColors.shuffle();
    myColors.shuffle();
    loc = new PVector(x, y);
    size = new PVector(w, h);
    movingDir = new PVector(random(-PI, PI), random(-PI, PI));
    movingDir.normalize();
    movingDir.mult(random(0.5, 2));

    ns1 = random(0.0, 100.0);
    ns2 = random(0.0, 100.0);
    ns3 = random(0.0, 100.0);
    ns4 = random(0.0, 100.0);
  }

  void display() {

    int n = 30;
    PVector startSize = PVector.mult(size, 0.5);
    PVector smallestSize = PVector.mult(startSize, 0.2);
    PVector sizeStep =  PVector.div(PVector.sub(startSize, smallestSize), n) ;
    noStroke();
    for (int i=0; i<n; i++) {


      if (i>0 && i< floor(n/3)) {
        fill(myColors.colors[0]);
      } else if (i>=floor(n/3) && i<=floor(n/3*2)) {
        fill(myColors.colors[2]);
      }
      //else {
      //  fill(myColors.colors[2]);
      //}

      //if (i < n/2) {
      //  fill(lerpColor(myColors.colors[0], myColors.colors[1], map(i, 0, n/2, 0, 1)));
      //} else {
      //  fill(lerpColor(myColors.colors[1], myColors.colors[2], map(i, n/2, n, 0, 1)));
      //}

      PVector offset = PVector.mult(movingDir, i);

      ellipse(loc.x + offset.x, loc.y + offset.y, startSize.x - sizeStep.x * i + (noise(ns3+i) * 70-70/2), startSize.y  - sizeStep.y * i + (noise(ns4+i)*70-70/2));
    }


    //  fill(0, 0, 0);
    // ellipse(loc.x, loc.y, 1, 1);
    stroke(0);
    line(loc.x, loc.y, loc.x + movingDir.x*10, loc.y + movingDir.y*10);

    ns1+=0.01;
    ns2+=0.01;
    ns3+=0.01;
    ns4+=0.01;
  }
}