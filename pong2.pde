Ball theBall;
Player thePlayer;
Player theComputer;
Score theScore;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  theBall = new Ball();
  thePlayer = new Player();
  theComputer = new Player();
  theScore = new Score();
  ellipseMode(RADIUS);
}

void draw()
{
  background(0);
  theBall.move();
  thePlayer.movePlayer(mouseX);
  theComputer.moveComputer(theBall);
  theBall.draw();
  thePlayer.drawPlayer();
  theComputer.drawComputer();
  theBall.collide(thePlayer, theComputer);
  theScore.draw();
  theScore.scored(theBall);
}

void mousePressed()
  {
    theBall.reset(thePlayer, theComputer, theScore);
  }