class BallFactory {


  BallFactory() {}
  
  Ball createNewBall() {
  
      
    Ball myBall = new Ball();

    myBall.setPosition( random( 45, width-45 ), random( 45, height-45) );
    myBall.setSpeed( random( 3, 5 ), random( 3, 5 ) );
    
    float ballSize = random(15, 25);
    
    myBall.setRadius( ballSize );
    myBall.setMass( ballSize / 4 );
    
    return myBall;
    
  }

}