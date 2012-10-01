import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

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

  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 1, 1, 1);
  //canvas.background(360);
  canvas.background(224.0 / 360, 0.0 / 100, 99.0 / 100);
  canvas.smooth();
  canvas.strokeWeight(90);
  canvas.strokeCap(SQUARE);
  canvas.strokeJoin(MITER);
  canvas.noFill();

  canvas.translate(canvas.width / 30, canvas.height / 20);

  /* Rings
   __________________________________________________________________*/
  // create a color
  TColor col = TColor.newHSV(229.0 / 360, 5.0 / 100, 40.0 / 100);

  /*
  AnalogousStrategy
   ComplementaryStrategy
   CompoundTheoryStrategy
   LeftSplitComplementaryStrategy
   MonochromeTheoryStrategy
   RightSplitComplementaryStrategy
   SingleComplementStrategy
   SplitComplementaryStrategy
   TetradTheoryStrategy
   TriadTheoryStrategy
   */
  ColorTheoryStrategy s = new MonochromeTheoryStrategy();

  // get a color list with colors for this strategy and the specific color
  // this is only a few colors
  ColorList colors = ColorList.createUsingStrategy(s, col);

  // just to show that it's possible, lets find 50 colors within this theme
  ColorList moreColors = new ColorRange(colors).addBrightnessRange(0, 1).getColors(null, 50, 0.05);
  moreColors.sortByDistance(false);

  for (Iterator j = moreColors.iterator(); j.hasNext();) 

  { 
    TColor c = (TColor) j.next();
    canvas.stroke(c.hue(), c.saturation(), c.brightness());
    canvas.ellipse(random(canvas.width), random(canvas.height), 5000, 5000);
  }

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

