int rows = 1;
int cols = 1;
int maxRows = 500;
int maxCols = 500;
int rowHeight = 0;
int colWidth = 0;
int rowDrawHeight = 0;
int colDrawWidth = 0;
int totalHeight = 0;
int totalWidth = 0;
int lowRangeR = 100;
int lowRangeG = 100;
int lowRangeB = 100;
int highRangeR = 220;
int highRangeG = 220;
int highRangeB = 220;
int alphaLevel = 125;

int lastMillis = 0;
int lastChangeMillis = 0;
int changeRateMS = 100;

void setup() {
  frameRate(120);
  fullScreen();
  updateDimensions();
  lastChangeMillis = millis();
}

void draw() {
  int x = 0;
  int y = 0;
  color currentColor = color(0,0,0);//color(random(0,254),random(0,254),random(0,254));
  noStroke();
  for(int cell = 0; cell < rows * cols; cell++) {
    x = cell % rows;
    y = cell / cols;
    currentColor = getRandomColor();
    fill(currentColor);
    rect(x * colWidth, y * rowHeight, (x + 1) * colDrawWidth, (y + 1) * rowDrawHeight);
  }
  // printFPS(); // wtf processing!
  introduceFuzz();
}

void updateDimensions() {
  totalWidth = displayWidth;
  totalHeight = displayHeight;
  colWidth = totalWidth / cols;
  rowHeight = totalHeight / rows;
  colDrawWidth = colWidth;
  rowDrawHeight = rowHeight;
}

void addRow() {
  if (rows < maxRows)
    rows++;
}

void addColumn() {
  if (cols < maxCols)
    cols++;
}

void removeRow() {
  if (rows > 1)
    rows--;
}

void removeColumn() {
  if (cols > 1)
    cols--;
}

void introduceFuzz() {
  if (millis() - lastChangeMillis > changeRateMS) {
    lastChangeMillis = millis();
    int randTest = (int) random(0,4);
    // println("fuzzing - " + randTest);
    switch(randTest) {
      default:
      // do nothing
      break;
      case 0: addColumn(); break;
      case 1: addRow(); break;
      case 2: removeColumn(); break;
      case 3: removeRow(); break;
    }
    updateDimensions();
  }
}

color getRandomColor() {
  return color(random(lowRangeR,highRangeR),random(lowRangeG,highRangeG),random(lowRangeB,highRangeB), alphaLevel);
}

int getFPS() {
  int now = millis();
  int duration = now - lastMillis;
  lastMillis = now;
  return 1000 / duration;
}

void printFPS() {
  println(getFPS());
}