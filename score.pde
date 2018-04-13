class Score
{
  int playerScore;
  int computerScore;
  boolean done;
  
  Score()
  {
    playerScore = 0;
    computerScore = 0;
    done = false;
  }
  
  void draw()
  {
    fill(255);
    PFont  myFont  =  loadFont("AgencyFB-Bold-48.vlw");  
    textFont(myFont);  
    text(Integer.toString(playerScore), SCREENX / 2 - 24,  SCREENY / 2 + MARGIN + FONTSIZE);
    text(Integer.toString(computerScore), SCREENX / 2 - 24, SCREENY / 2 - MARGIN );
  }
  
  void scored(Ball theBall)
  {
    if ( !done )
    {
      if ( theBall.y < 0 )
      {
        playerScore++;
        done = true;
        theBall.dy -= 1;
      }
      if ( theBall.y > SCREENY )
      {
        computerScore++;
        done = true;
        theBall.dy += 1;
      }
    }
    if ( playerScore == 3 )
    {
      text("YOU WON, YOU ARE AWESOME", 20, 300);
    }
    else if ( computerScore == 3 )
    {
      text("YOU LOST, BETTER LUCK NEXT TIME", 20, 300);
    }
  }
}