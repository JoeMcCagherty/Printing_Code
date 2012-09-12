void setup() {
  size(612, 792);
  smooth();
}

void draw() {
  background(255);
  fill(0);

  drawEllipse();
  drawTriangle();
  drawRect();
}  

void drawEllipse() {

  ellipse(306, 240, 120, 114);
}

void drawTriangle() {

  triangle(260, 300, 352, 300, 306, 479);
}

void drawRect() {

  rect(256, 275, 100, 25, 3);
}

