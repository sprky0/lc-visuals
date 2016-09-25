int rows = 40;
int cols = 40;
int maxRows = 500;
int maxCols = 500;
int rowHeight = 0;
int colWidth = 0;
int rowDrawHeight = 0;
int colDrawWidth = 0;
int totalHeight = 0;
int totalWidth = 0;
int lastMillis = 0;
int lowRangeR = 100;
int lowRangeG = 100;
int lowRangeB = 100;
int highRangeR = 120;
int highRangeG = 120;
int highRangeB = 120;

void setup() {
  frameRate(120);
  fullScreen();
  updateDimensions();
}

void draw() {
  int x = 0;
  int y = 0;
  color currentColor = color(0,0,0);//color(random(0,254),random(0,254),random(0,254));
  noStroke();
  for(int cell = 0; cell < rows * cols; cell++) {
    x = cell % rows;
    y = cell / cols;
    // currentColor = getRandomColor();
    fill(currentColor);
    rect(x * colWidth, y * rowHeight, (x + 1) * colWidth, (y + 1) * rowHeight);
  }
  // printFPS(); // wtf processing!
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

color getRandomColor() {
  return color(random(lowRangeR,highRangeR),random(lowRangeG,highRangeG),random(lowRangeB,highRangeB));
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