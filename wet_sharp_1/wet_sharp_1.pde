
/*  Properties
 _________________________________________________________________ */

PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

/*  Setup
 _________________________________________________________________ */

void setup()
{ 
  size(800, 800);
  background(0);
  smooth();
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  
  //canvas.translate(canvas.width / 30, canvas.height / 20);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(255);
  canvas.stroke(0);
  canvas.strokeWeight(20);
  canvas.strokeCap(SQUARE);
  canvas.strokeJoin(MITER);
  canvas.fill(0);

  /* Sharp
   __________________________________________________________________*/

  canvas.beginShape();

  canvas.vertex(0, 5100);
  canvas.vertex(0, 760);
  canvas.vertex(360, 600);
  canvas.vertex(1350, 1025);

  canvas.curveVertex(1350, 1025);
  canvas.curveVertex(1350, 1025);
  canvas.curveVertex(325, 1800);
  canvas.curveVertex(550, 2250);
  canvas.curveVertex(1800, 1900);
  canvas.curveVertex(1800, 1900);

  canvas.vertex(1800, 1900);
  canvas.vertex(2600, 2650);

  canvas.curveVertex(2600, 2650);
  canvas.curveVertex(2600, 2650);
  canvas.curveVertex(1450, 3250);
  canvas.curveVertex(1600, 3800);
  canvas.curveVertex(2825, 3600);
  canvas.curveVertex(2825, 3600);

  canvas.vertex(2825, 3600);
  canvas.vertex(3555, 4555);

  canvas.curveVertex(3555, 4555);
  canvas.curveVertex(3555, 4555);
  canvas.curveVertex(2450, 4800);
  canvas.curveVertex(2000, 5100);
  canvas.curveVertex(2450, 5100);
  canvas.curveVertex(2450, 5100);

  canvas.vertex(2450, 5100);
  canvas.vertex(0, 5100);

  canvas.endShape();

  /* Wet
   _________________________________________________________________ */

  canvas.beginShape();

  canvas.vertex(5100, 0);

  canvas.vertex(2800, 0);

  canvas.curveVertex(2800, 0);
  canvas.curveVertex(2800, 0);
  canvas.curveVertex(2700, 1900);
  canvas.curveVertex(3380, 2100);
  canvas.curveVertex(3360, 500);
  canvas.curveVertex(3360, 500);

  canvas.vertex(3360, 500);

  canvas.curveVertex(3360, 500);
  canvas.curveVertex(3360, 300);
  canvas.curveVertex(4000, 500);
  canvas.curveVertex(4200, 700);
  canvas.curveVertex(4175, 1000);
  canvas.curveVertex(4175, 1000);

  canvas.vertex(4175, 1000);

  canvas.curveVertex(4175, 1000);
  canvas.curveVertex(4175, 800);
  canvas.curveVertex(3975, 3350);
  canvas.curveVertex(4475, 3350);
  canvas.curveVertex(4530, 1900);
  canvas.curveVertex(4530, 1900); 

  canvas.vertex(4530, 1900);

  canvas.curveVertex(4530, 1900);
  canvas.curveVertex(4530, 1800);
  canvas.curveVertex(4600, 1300);
  canvas.curveVertex(5000, 1300);
  canvas.curveVertex(4900, 1900);
  canvas.curveVertex(4900, 1900); 

  canvas.vertex(4900, 1900);

  canvas.curveVertex(4900, 1900);
  canvas.curveVertex(4900, 1800);
  canvas.curveVertex(4800, 2500);
  canvas.curveVertex(5100, 2500);
  canvas.curveVertex(5100, 1700);
  canvas.curveVertex(5100, 1700); 

  canvas.vertex(5100, 1700);

  canvas.vertex(5100, 0);

  canvas.endShape();
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("grab.tiff");
}

/*  Calculate resizing
 _________________________________________________________________ */

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

