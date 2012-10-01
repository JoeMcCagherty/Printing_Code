import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

void setup() 
{
  size(1280, 800);
  background(255);
  colorMode(HSB, 1, 1, 1);
  noStroke();
  smooth();

  translate(50, 40);

  // create a color
  TColor col = TColor.newHSV(0 / 360, 50 / 100, 26 / 100);

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
  ColorList moreColors = new ColorRange(colors).addBrightnessRange(0, 1).getColors(null, 106, 0.05);
  moreColors.sortByDistance(false);

  for (Iterator j = moreColors.iterator(); j.hasNext();) 
  {
    TColor c = (TColor) j.next();
    fill(c.hue(), c.saturation(), c.brightness());
    ellipse(random(width), random(height), 50, 50);
  }
}

