import processing.sound.*;

float speed[]= new float[50];
int COUNT = 20;
float TextSize=18;
float Xs[]= new float[COUNT];
float Ys[]= new float[COUNT];
float Zoom = 1;

//music
SoundFile file;
String Music = "matrixsong.mp3";
String path;

void setup()
{
  size(800, 800);
  background(0, 0, 0);
//music
  //path = sketchPath(Music);
  //file = new SoundFile(this, path);
  // file.play(); 

//random position(x) for starting, starts from top
  for (int i=0; i<COUNT; i++)
  {
    Xs[i] = random(0, width);
    Ys[i] = 0;
  }
//random speed
  for (int i=0; i<50; i++)
  {
    speed[i]=random(3,6);
  }
}



void draw()
{
//trail
  fill(0, 0, 0, 2);
  rect(0, 0, width, height);

  for (int i=0; i<COUNT; i++)
  {
    //matrix code
    fill(0, 255, 0);
    textSize(TextSize);
    text((int)random(0, 9), Xs[i], Ys[i]);


//speed codes
    Ys[i] = Ys[i] + (int)random(1, 5)*(TextSize/8);
   // Ys[i] = Ys[i] + speed[i]/3*(TextSize/8);

//from bottom to top code
    if (Ys[i] > 810)
    {
      Ys[i] = 0;
      Xs[i] = random(0, width);
    }
//restart code
    if (key == CODED)
    {
      if (keyCode == UP) 
      {
        background(0, 0, 0);
      }
    }
  }
}




void keyPressed()
{
  //to make the code bigger/smaller
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      TextSize=TextSize+2;
    }
    if (keyCode==LEFT)
    {
      TextSize=TextSize-2;
    }
    if (keyCode==' ')
    {
      TextSize=12;
    }
  }
}