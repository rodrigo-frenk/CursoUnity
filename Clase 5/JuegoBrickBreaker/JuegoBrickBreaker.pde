import controlP5.*;



// Maquina de estados finitos

final int estadoBienvenida = 0;
final int estadoElegir = 1;
final int estadoJugando = 2;
final int estadoPerdiste = 3;
final int estadoGanaste = 4;


int numEstados = 5;
int numBricks = 50;

float ballSpeed = 5;
float ballSize = 10;

int padWidth = 100;  
int padHeight = 25;
float step = 0.05;


int bricksPerRow=10;
float brickW, brickH;
float marginX, marginY= 100;
float brickWallH;


int estado;
int dificultad;
boolean [] bricks;
PFont fontL, fontS;

ControlP5 cp5;
RadioButton r;


Ball theBall;
Player player1;



void setup() 
{

  size( 1000, 800 );

  estado = 0;
  bricks = new boolean[numBricks];
  for (int i= 0; i < numBricks; i++ ) {
    /// bricks[i]= true;
    bricks[i] = !boolean( i%3 );
  }


  bricksPerRow=10;
  brickW = width/(bricksPerRow*2);
  brickH = brickW;
  brickWallH = ( numBricks / bricksPerRow ) * brickH;

  marginX= (width-(bricksPerRow*brickW))/2;
  marginY= 100;



  theBall = new Ball();

  resetBall();

  player1 = new Player();  
  player1.setName( "Juan" );






  contador = 0;

  fontL = createFont("Cabin-Bold.ttf", 42);
  fontS = createFont("Cabin-Bold.ttf", 22);

  cp5 = new ControlP5( this );
  cp5.setFont( fontS );

  r = cp5.addRadioButton("dificultad");
  r.setPosition(width/2 - 380, height/2 + 100);
  r.setItemsPerRow( 3 );
  r.setSize( 50, 50 ).setSpacingColumn( 250 ).setSpacingRow( 10 );
  r.addItem("facil", 0).addItem("intermedio", 1).addItem("dificil", 2);

  r.hide();
}

int contador;

void draw()
{

  

  background(0);

  stroke(255);



  String textoEstado;
  switch( estado ) {

  case estadoBienvenida:
    textoEstado = "Bienvenido";
    textFont(fontL);
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    contador++;
    if( contador > 60 ) { 
      contador++;
      estado++;
    }
    break;

  case estadoElegir:
    textoEstado = "Elegir";
    textFont(fontL);

    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    r.show();
    break;

  case estadoJugando:
    drawBricks();

    moveBall();

    drawBall();

    drawPad();

    drawText();


    break;


  case estadoPerdiste:
    textoEstado = "Perdiste";
      textFont(fontL);
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;



  case estadoGanaste:
    textoEstado = "Ganaste";
      textFont(fontL);
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;
  }
}

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isFrom(r)) {
    dificultad = int(theEvent.getValue());
    switch( dificultad ) {
      case 0: 
        ballSpeed = 5;
        break;
     
      case 1: 
        ballSpeed = 8;
        break;
        
     
      case 2: 
        ballSpeed = 11;
        break;
    }
    estado++;
    r.hide();
  }
}


//funciones de dibujo
void moveBall() {

  theBall.getPosition().add( theBall.getSpeed() );
  doBall2WallCollision();
  doBall2PadCollision();
  doBall2BrickCollision();
}

void drawBall() {
  ellipse( theBall.getPosition().x, theBall.getPosition().y, theBall.getRadius() * 2, theBall.getRadius() * 2);
}


void drawPad() {

  rect( ( player1.getPosition() * width ) - padWidth / 2, height-padHeight, padWidth, padHeight );
}


void drawBricks()
{

  for (int i = 0; i < numBricks; i++) {
    fill(125);
    stroke(0);    
    if ( bricks[i] ) {
      rect( marginX + ((i%bricksPerRow)*brickW), marginY+floor(i/bricksPerRow)*brickW, brickW, brickH);
    }
  }
}


void drawText() {

  fill(255);

  textFont(fontS);


  text( player1.getName(), 10, 30);
  text("Vidas: " + ( 4 - player1.getPoints() ), 10, 50);
}

void resetBall() {


  theBall.setPosition( width / 2, height - padHeight - theBall.getRadius() );

  int randomDirection = int( map( round(random(0, 1)), 0, 1, -1, 1 ));
  theBall.setSpeed( ballSpeed * randomDirection, - ballSpeed );

  theBall.setRadius( ballSize );
  theBall.setMass( ballSize / 4 );
}






void doBall2PadCollision() {

  if ( theBall.getPosition().y>= height - padHeight - theBall.getRadius() / 2) {
    if ( 
      (
      ( theBall.getPosition().x > ( player1.getPosition() * width ) - padWidth / 2 )
      &&
      ( theBall.getPosition().x < ( player1.getPosition() * width ) + padWidth / 2 )
      )

      ) {
      theBall.setSpeedY( theBall.getSpeed().y * -1 );
      moveBall();
    } else {

      player1.addPoint();
      println( "vidas: " + ( 3 - player1.getPoints() ) );
      if ( player1.getPoints()>3 ) {
        estado = estadoPerdiste;
      } else {
        resetBall();
      }
    }
  }
}


void doBall2WallCollision() {


  if ( ! inRange( theBall.getPosition().x, 0, width) ) {
    theBall.setSpeedX( theBall.getSpeed().x * -1 );
  }

  if ( theBall.getPosition().y <= 0 ) {
    theBall.setSpeedY( theBall.getSpeed().y * -1 );
  }
}


void doBall2BrickCollision() {

  //algoritmo para detectar punto en Reticula
  float ballX = theBall.getPosition().x;
  float ballY = theBall.getPosition().y;

  if ( 
    ballX > marginX
    && ballX < width- marginX
    && ballY > marginY
    && ballY < marginY + brickWallH
    )
  {
    int whichX = floor( (ballX-marginX) /  (width-marginX*2) * bricksPerRow);
    int whichY = floor( (ballY-marginY) / brickWallH * ( numBricks / bricksPerRow ) );
    int whichBrick = int( whichX + (whichY * bricksPerRow) ); 
    //  println( "X: " + whichX + " --- " + "Y: " + whichY + " --- Current: " + int( whichX + (whichY * bricksPerRow) ) ); 

    if ( bricks[ whichBrick ] ) {
      bricks[ whichBrick ] = false;
      
      theBall.getSpeed().mult(-1);
      moveBall();
      
      checkGameDone();
      
    }
  }
}



void newRound() {
  resetBall();
}








boolean inRange( float value, float rangeMin, float rangeMax ) {

  if ( value < rangeMin || value > rangeMax ) {
    return false;
  } else {
    return true;
  }
}


void keyPressed() {

  if ( key == 'a' || key == 'A' ) { 
    player1.setPosition( player1.getPosition() - step );
  }
  if ( key == 'd' || key == 'D' ) { 
    player1.setPosition( player1.getPosition() + step );
  }
}




void mousePressed() {

  if ( 
    mouseX > marginX
    && mouseX < width- marginX
    && mouseY > marginY
    && mouseY < marginY + brickWallH
    )
  {
    int whichX = floor( (mouseX-marginX) /  (width-marginX*2) * bricksPerRow);
    int whichY = floor( (mouseY-marginY) /  brickWallH * ( numBricks / bricksPerRow ) );
    int whichBrick = int( whichX + (whichY * bricksPerRow) ); 
    println( "X: " + whichX + " --- " + "Y: " + whichY + " --- Current: " + int( whichX + (whichY * bricksPerRow) ) ); 

    if ( bricks[ whichBrick ] ) {
      bricks[ whichBrick ] = false;
      checkGameDone();
    }
    
  } else {
    print("..");
  }
}



void checkGameDone() {
  boolean bricksRemaining = false;
  
  for( int i = 0; i<bricks.length; i++) {
    if( bricks[i] ) {
      bricksRemaining = true;
      break;
    }
  }
  
  if( ! bricksRemaining ) {
    estado = estadoGanaste;
  }
}