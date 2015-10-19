int numBalls = 202;


Ball [] balls;



void setup() {


  balls = new Ball[ numBalls ];

  for ( int indice = 0; indice < balls.length; indice++ ) {

    Ball ball = new Ball();

    ball.setPosition( random( 45, width-45 ), random( 45, height-45) );
    ball.setSpeed( random( 3, 5 ), random( 3, 5 ) );
    ball.setRadius( random(15, 25) );
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

        float newVelX1 = ( ball.getSpeed().x * ( ball.getMass() - otherBall.getMass() ) + ( 2 * otherBall.getMass() * otherBall.getSpeed().x ) ) / ( ball.getMass() + otherBall.getMass() );
        float newVelY1 = ( ball.getSpeed().y * ( ball.getMass() - otherBall.getMass() ) + ( 2 * otherBall.getMass() * otherBall.getSpeed().y ) ) / ( ball.getMass() + otherBall.getMass() );

        float newVelX2 = ( otherBall.getSpeed().x * ( otherBall.getMass() - ball.getMass() ) + ( 2 * ball.getMass() * ball.getSpeed().x ) ) / ( otherBall.getMass() + ball.getMass() );
        float newVelY2= ( otherBall.getSpeed().y * ( otherBall.getMass() - ball.getMass() ) + ( 2 * ball.getMass() * ball.getSpeed().y ) ) / ( otherBall.getMass() + ball.getMass() );

       
        ball.setSpeed( newVelX1, newVelY1 );
        otherBall.setSpeed( newVelX2, newVelY2 );

        ball.animate();
        otherBall.animate();
        
        
      }
    }
  }
}


void doBall2WallCollisions( Ball ball ) {

  if ( ! inRange( ball.getPosition().x, ball.getRadius() * 2, width - ball.getRadius() * 2 ) ) {
    ball.setSpeedX( ball.getSpeed().x * -1 );

    ball.animate();
  }

  if ( ! inRange( ball.getPosition().y, ball.getRadius() * 2, height - ball.getRadius() * 2 ) ) {
    ball.setSpeedY( ball.getSpeed().y * -1 );
    ball.animate();
  }
}



boolean inRange( float value, float rangeMin, float rangeMax ) {

  if ( value < rangeMin || value > rangeMax ) {
    return false;
  } else {
    return true;
  }
}