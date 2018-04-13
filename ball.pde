class Ball
{
  
  float x;
  float dx;
  float y;
  float dy;
  int radius;
  
  Ball()
  {
    x = SCREENX/2;
    y = SCREENY/2;
    dx = 1.5;
    dy = 1.5;
    radius = 5;
  }
  
  void move()
  {
    x += dx;
    y += dy;
  }
  
  void draw()
  {
    fill(255);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide( Player thePlayer, Player theComputer )
  {
    if ( y+radius >= thePlayer.ypos && y-radius<thePlayer.ypos+PADDLEHEIGHT && 
         x >=thePlayer.xpos && x <= thePlayer.xpos+PADDLEWIDTH 
         && ( thePlayer.xpos > thePlayer.prevxpos && dx < 0 
         || thePlayer.xpos < thePlayer.prevxpos && dx > 0 ) )
    {
      dy = -dy;
      dx = -dx;
    }
    
    else if ( y+radius >= thePlayer.ypos && y-radius<thePlayer.ypos+PADDLEHEIGHT && 
         x >=thePlayer.xpos && x <= thePlayer.xpos+PADDLEWIDTH )
    {
      dy = -dy;
    }
    
    if ( y-radius <= theComputer.ypos1 + PADDLEHEIGHT && y+radius >= theComputer.ypos1 && 
         x >= theComputer.xpos1 && x <= theComputer.xpos1 + PADDLEWIDTH 
         && ( theComputer.xpos1 > theComputer.prevxpos1 && dx < 0 
         || theComputer.xpos1 < theComputer.prevxpos1 && dx > 0 ) )
    {
      dy = -dy;
      dx = -dx;
    }
    
    else if ( y-radius <= theComputer.ypos1 + PADDLEHEIGHT && y+radius >= theComputer.ypos1 && 
         x >= theComputer.xpos1 && x <= theComputer.xpos1 + PADDLEWIDTH )
    {
      dy = -dy;
    }
    
    if ( x <= 0 || x + radius >= SCREENX )
    {
      dx = -dx;
    }
  }
  
  void reset(Player thePlayer, Player theComputer, Score theScore)
  {
    if ( ( y > SCREENY || y < 0 ) )
    {
      x = SCREENX/2;
      y = SCREENY/2;
      thePlayer.xpos = SCREENX/2;
      theComputer.xpos1 = SCREENX/2;
      theScore.done = false;
      if ( dx > 0 )
      {
        dx += 1;
      }
      else
      {
        dx -= 1;
      }
      theComputer.dx += 1;
    } 
  }
}