
// variable para dificultad:
float ballSpeed = 11;

float step = 0.05;



Ball theBall;

Player player1, player2;

float ballSize = 12;

int padWidth = 25;  
int padHeight = 100;



PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
 //<>//


PImage texture;



boolean shouldDrawBall;

void setup() {

  size(1000,500);
  
  player1 = new Player();
  player2 = new Player();
  
  player1.setName( "Juan" );
  player2.setName( "Pedro" );
  
  font = createFont("Cabin-Bold.ttf", 13);
  textFont(font);
  
  theBall = new Ball();
  
  resetBall();

  texture = loadImage("tex.png");
  texture.width = padWidth;
  texture.height = padHeight;
  
  shouldDrawBall = false;
}


void resetBall() {


    theBall.setPosition( width / 2, random( 45, height-45) );
    
    int randomDirection = int( map( round(random(0,1)), 0, 1, -1, 1 ));
    theBall.setSpeed( ballSpeed * randomDirection, ballSpeed );
   
    theBall.setRadius( ballSize );
    theBall.setMass( ballSize / 4 );
    
    shouldDrawBall = true;
    
  
}

void draw() {

   moveBall();

   drawStage();
   drawBall();

 
}


void drawStage() {
  
   clearBackground();  
   drawText();
   drawMiddleLine();
   drawPads();
   
}

void drawText() {

   fill(255);
   
   text( player1.getName(), 10, 30);
   text("Points: " + player1.getPoints(), 10, 50);
   text("Games Won: " + player1.getTotalWonGames(), 10, 70);

   text( player2.getName(), width - 100, 30);
   text("Points: " + player2.getPoints(), width - 100, 50);
   text("Games Won: " + player2.getTotalWonGames(), width - 100, 70);

}


void drawMiddleLine() {
 stroke(127);
   strokeWeight(3);
   
   int numDrawCircles = 20;
   
   int circleSeparation = 2;
   float circleHeight = ( height / numDrawCircles ) - ( circleSeparation * 2 );
   
   for( int i = 0; i < numDrawCircles; i++ ) {
     noStroke();
     ellipse( width / 2, ( circleSeparation * 2 + circleHeight  ) * (i+0.5), circleHeight / 2 , circleHeight / 2 );
     
   }
   
 }
 
 
void moveBall() {
  
  theBall.getPosition().add( theBall.getSpeed() );
  doBall2WallCollision();
  doBall2PadCollision();

}

void clearBackground() {
  background(0);
}
void drawBall() {
  if( shouldDrawBall ) {
    ellipse( theBall.getPosition().x,theBall.getPosition().y,theBall.getRadius() * 2,theBall.getRadius() * 2);
  }
}

void drawPads() {

  //rect( 0, ( player1.getPosition() * height ) - padHeight / 2, padWidth, padHeight );
  image( texture, 0, ( player1.getPosition() * height ) - padHeight / 2 );
  //rect( width-padWidth, ( player2.getPosition() * height ) - padHeight / 2, padWidth, padHeight );
  image( texture, width-padWidth, ( player2.getPosition() * height ) - padHeight / 2 );

}

void newRound() {
  shouldDrawBall = false;
  
  drawStage();

  delay(2000);
  resetBall();
}

void newGame() {
  shouldDrawBall = false;
  drawStage();

  delay(4000);

  player1.setPoints(0);
  player2.setPoints(0);
  resetBall();

}

void doBall2PadCollision() {

  boolean isLeft = theBall.getPosition().x - theBall.getRadius() <= padWidth;
  boolean isRight = theBall.getPosition().x + theBall.getRadius() >= width - padWidth;

  println( "left:" + isLeft );
  if( isLeft || isRight) {
    if(
      (
        ( theBall.getPosition().y > ( player1.getPosition() * height ) - padHeight / 2 )
        &&
        ( theBall.getPosition().y < ( player1.getPosition() * height ) + padHeight / 2 )
      )
      ||
      (
        ( theBall.getPosition().y > ( player2.getPosition() * height ) - padHeight / 2 )
        &&
        ( theBall.getPosition().y < ( player2.getPosition() * height ) + padHeight / 2 )
      )
    ) {
      theBall.setSpeedX( theBall.getSpeed().x * -1 );
      moveBall();
    }
    
  }
 
  

}


void doBall2WallCollision() {

  if ( ! inRange( theBall.getPosition().x, 0, width ) ) {
    //theBall.setSpeedX( theBall.getSpeed().x * -1 );
    if( theBall.getPosition().x < 0 ) {
      player2.addPoint();
    } else if( theBall.getPosition().x > width ) {
      player1.addPoint();
    }
    
    if( player1.getPoints() >= 5 ) { 
      player1.addTotalWonGames();
      newGame();
    } else if(  player2.getPoints() >= 5 ) {
      player2.addTotalWonGames();
      newGame();
    }
    else {
      newRound();
    }  
    
  }

  if ( ! inRange( theBall.getPosition().y, 0, height) ) {
    theBall.setSpeedY( theBall.getSpeed().y * -1 );

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

  if( key == 'q' || key == 'Q' ) { player1.setPosition( player1.getPosition() - step ); }
  if( key == 'a' || key == 'A' ) { player1.setPosition( player1.getPosition() + step ); }

  if( key == 'o' || key == 'O' ) { player2.setPosition( player2.getPosition() - step ); }
  if( key == 'l' || key == 'L' ) { player2.setPosition( player2.getPosition() + step ); }

}