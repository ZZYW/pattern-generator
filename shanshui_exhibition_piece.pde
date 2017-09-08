Gradient[] gradients;
ColorScheme[] colorschemes = new ColorScheme[5];
ArrayList<ColorScheme> allColorSchemes;

int w, h;
int horN = 7;
int verN;
PShader blur;

void setup() {
  size(1400, 800, P3D);
  //pixelDensity(2);
  blur = loadShader("blur.glsl"); 

  allColorSchemes = new ArrayList<ColorScheme>();
  loadColorSchemes("colorSchemes.txt");
  w = width/horN;
  h = w;
  verN = floor(height/w);
  gradients = new Gradient[horN*verN];

  int i=0;
  for (int x=0; x<horN; x++) {
    for (int y=0; y<verN; y++) {
      gradients[i] = new Gradient(x*w, y*h, w, h);
      i++;
    }
  }
}

void draw() {
  fill(255, 5);
  noStroke();
  rect(0, 0, width, height);

  //background(255);
  pushMatrix();
  translate(w/2, h/2);
  for (int i=0; i < gradients.length; i++) {
    gradients[i].display();
  }
  popMatrix();

  for (int i=0; i<10; i++) {
    filter(blur);
  }



  //colorMode(RGB, 255);
  fill(0);
  text(frameRate, 10, 10);
}

void loadColorSchemes(String filename) {
  String[] lines = loadStrings(filename); //get all the lines in the file.
  for (String line : lines) { //iterate through all the lines
    String[] colors = split(line, ","); //in each line, get each color (4 in total )in String format
    color[] oneSet = new color[colors.length];
    for (int i=0; i<colors.length; i++) {  //convert each colro to color
      color realColor = unhex("FF"+colors[i].substring(1));
      if (realColor==0)println("Err: color is 0, color import failed");
      oneSet[i] = realColor;
    }
    ColorScheme colorScheme = new ColorScheme(oneSet);
    allColorSchemes.add(colorScheme);
  }
}



void mouseClicked() {
  for (int i=0; i<gradients.length; i++) {
    gradients[i].myColors.shuffle();
  }
}