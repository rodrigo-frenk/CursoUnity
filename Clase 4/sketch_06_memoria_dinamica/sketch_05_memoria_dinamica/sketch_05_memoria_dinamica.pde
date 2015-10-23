ArrayList <Ball> balls;

int numBalls = 3;


BallFactory factory;

 

void setup() {

  factory = new BallFactory();

  balls = new ArrayList <Ball> ();

  for ( int indice = 0; indice < numBalls; indice++ ) {

    balls.add( factory.createNewBall() );
    
  }


  size(1300, 600);
}



void draw() {


  background( 127 );

  for ( int indice = 0; indice < balls.size(); indice++ ) {

    Ball ball = balls.get( indice );

    ball.animate();

    ball.show();

    doBall2BallCollisions( ball );

    doBall2WallCollisions( ball );
  }
}





void doBall2BallCollisions( Ball ball ) {

  for ( int i = 0; i < balls.size(); i++ ) {

    // revisar bola por bola si nuestra distancia es menor
    Ball otherBall = balls.get( i );

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



void keyPressed() {

    if( key == '+' ) {
      
      balls.add( factory.createNewBall() );
      
    }

}



PVector oldMouse;

PVector direction ;

void mouseDragged() {
  // nuestra direcciòn se almacenará en un PVector.
  // sus valores posibles son -1, 0, ò 1, para indicar en qué sentido se mueven con respecto a los ejes X y Y
  direction = new PVector( 0, 0 );
  
  if( oldMouse != null ) {  
    
    if( mouseX > oldMouse.x ) {
      direction.x = 1;
    }
    if( mouseX < oldMouse.x ) {
      direction.x = -1;
    }
    
    
    
    if( mouseY > oldMouse.y ) {
      direction.y = 1;
    }
    if( mouseY < oldMouse.y ) {
      direction.y = -1;
    }    
    
    println( "dirección: " + direction );

    for( int i = 0; i < balls.size(); i ++ ) {
      balls.get(i).setSpeed(PVector.add( balls.get(i).getSpeed(), direction ) );
    }
    
  }
  
  
  
  oldMouse = new PVector( mouseX, mouseY );

}

void mousePressed() {
  for( int i = 0; i < balls.size(); i ++ ) {
    
    PVector clickPosition = new PVector( mouseX, mouseY );
    
    Ball checkBall = balls.get(i);
    
    if( clickPosition.dist( checkBall.getPosition() ) < checkBall.getRadius() ) {
      balls.remove( checkBall );
    } 
    
  }
}