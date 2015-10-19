float posicionX, posicionY;
float velocidadX, velocidadY;




void setup() {

  size(700, 600);

  posicionX = random( 0, width );
  posicionY = random( 0, height );

  velocidadX = 5;
  velocidadY = 5;
 
  
}

void draw() {

  background( 0 );


  if ( posicionX <= 0 || posicionX >= width ) {
    velocidadX *= -1;
  }

  if ( posicionY <= 0 || posicionY >= height ) {
    velocidadY *= -1;
  }  
  
  
  

  /*
  posicionX = posicionX + velocidadX;
   posicionY = posicionY + velocidadY;
   */


  // sintaxis abreviada:
  posicionX += velocidadX;
  posicionY += velocidadY;
  


  ellipse( posicionX, posicionY, 30, 30 );
  
  
}

float incremento = 0.5;

void keyPressed() {

  // cambiar dirección:
  if( key == 'x' || key == 'X') {
    velocidadX *= -1;
  }
  if( key == 'y' || key == 'Y') {
    velocidadY *= -1;
  }
  
  
  // alterar velocidad:
  if( key == '+' ) {
    velocidadX += incremento;
    velocidadY += incremento;
  }
  if( key == '-' ) {
    velocidadX -= incremento;
    velocidadY -= incremento;
  }
  
  
}


void mousePressed() {
  
  velocidadX *= -1;
  velocidadY *= -1;
  
}