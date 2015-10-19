int numBalls = 22;


Ball [] balls;



void setup() {


  balls = new Ball[ numBalls ];

  for ( int indice = 0; indice < balls.length; indice++ ) {

    Ball ball = new Ball();

    ball.setPosition( random( 0, width ), random( 0, height ) );
    ball.setSpeed( random( 3, 5 ), random( 3, 5 ) );
    ball.setRadius( random(5, 15) );
    ball.setMass( random(1, 4) );

    balls[ indice ] = ball;
  }


  size(1300, 600);
}



void draw() {


  background( 127 );

  for ( int indice = 0; indice < balls.length; indice++ ) {

    Ball ball = balls[indice];
    
    ball.animate();
    
    ball.show();
    
    doBall2BallCollisions( ball );
    
    doBall2WallCollisions( ball );
    
  }
  
}





void doBall2BallCollisions( Ball ball ) {

  for ( int i = 0; i < balls.length; i++ ) {

    // revisar bola por bola si nuestra distancia es menor
    Ball otherBall = balls[ i ];

    if ( ball != otherBall ) {

      float distance = PVector.dist( ball.getPosition(), otherBall.getPosition() );

      if ( ( ball.getRadius() + otherBall.getRadius() ) > distance ) {

        ball.setSpeed( ball.getSpeed().mult( -1 ) );
        
      }
    }
  }
  
}


void doBall2WallCollisions( Ball ball ) {

  if ( ! inRange( ball.getPosition().x, 0, width ) ) {
    ball.setSpeedX( ball.getSpeed().x * -1 );
  }

  if ( ! inRange( ball.getPosition().y, 0, height ) ) {
    ball.setSpeedY( ball.getSpeed().y * -1 );
  }
  
}



boolean inRange( float value, float rangeMin, float rangeMax ) {

  if ( value <= rangeMin || value >= rangeMax ) {
    return false;
  } else {
    return true;
  }
}