class Player 
{
  int xpos;
  int ypos;
  int xpos1;
  int ypos1;
  int dx;
  int prevxpos;
  int prevxpos1;
  
  Player ()
  {
    xpos = SCREENX/2;
    ypos = SCREENY - MARGIN - PADDLEHEIGHT;
    xpos1 = SCREENX/2;
    ypos1 = MARGIN;
    dx = 1;
  }
  
  void movePlayer( int x )
  {
    prevxpos = xpos;
    
    if ( x > SCREENX - PADDLEWIDTH )
    {
      xpos = SCREENX - PADDLEWIDTH;
    }
    
    else if ( x < 0 )
    {
      xpos = 0;
    }
    
    else
    {
      xpos = x;
    }
  }
  
  void moveComputer( Ball theBall )
  {
    prevxpos1 = xpos1;
    
    if ( theBall.x > xpos1 + PADDLEWIDTH / 2 )
    {
      xpos1 += dx;
    }
    if ( theBall.x < xpos1 + PADDLEWIDTH / 2 )
    {
      xpos1 -= dx;
    }
    if ( xpos1 + PADDLEWIDTH > SCREENX )
    {
      xpos1 = SCREENX - PADDLEWIDTH;
    }
    else if ( xpos1 < 0 )
    {
      xpos1 = 0;
    }
  }
  void drawPlayer()
  {
    fill(255);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void drawComputer()
  {
    fill(255);
    rect(xpos1, ypos1, PADDLEWIDTH, PADDLEHEIGHT);
  }
}