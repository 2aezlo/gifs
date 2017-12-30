import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;

public void setup() {
  smooth();
  size(400, 400);

  gifExport = new GifMaker(this, "ring.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation


void drawRing(int x, int y, float w1, float w2, int segments)
{
  // w1 == outer radius, w2 == inner radius.
  float deltaA=(1.0/(float)segments)*TWO_PI;
  beginShape(QUADS);
  for(int i=0;i<segments;i++)
  {
    vertex(x+w1*cos(i*deltaA),y+w1*sin(i*deltaA));
    vertex(x+w2*cos(i*deltaA),y+w2*sin(i*deltaA));
    vertex(x+w2*cos((i+1)*deltaA),y+w2*sin((i+1)*deltaA));
    vertex(x+w1*cos((i+1)*deltaA),y+w1*sin((i+1)*deltaA));
  }
  endShape();
} 

void export() {
  if(frames < totalFrames) {
    gifExport.setDelay(20);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}
