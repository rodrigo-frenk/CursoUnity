float posicionX1, posicionY1;
float velocidadX1, velocidadY1;

float posicionX2, posicionY2;
float velocidadX2, velocidadY2;


float radio1, radio2;



void setup() {

  size(700, 600);

  posicionX1 = random( 0, width );
  posicionY1 = random( 0, height );

  velocidadX1 = 5;
  velocidadY1 = 3;


  posicionX2 = random( 0, width );
  posicionY2 = random( 0, height );

  velocidadX2 = 7;
  velocidadY2 = 5;


  radio1 = random( 30, 60 );
  radio2 = random( 30, 60 );
}



void draw() {

  encerrarPelotas();

  avanzarAnimacion();

  dibujar();


  if ( revisarColision() ) {

    invertirVelocidades();
    
  }
  
}



void encerrarPelotas() {

  if ( posicionX1 <= 0 || posicionX1 >= width ) {
    velocidadX1 *= -1;
  }

  if ( posicionY1 <= 0 || posicionY1 >= height ) {
    velocidadY1 *= -1;
  }  


  if ( posicionX2 <= 0 || posicionX2 >= width ) {
    velocidadX2 *= -1;
  }

  if ( posicionY2 <= 0 || posicionY2 >= height ) {
    velocidadY2 *= -1;
  }
}

void avanzarAnimacion() {

  posicionX1 += velocidadX1;
  posicionY1 += velocidadY1;
  posicionX2 += velocidadX2;
  posicionY2 += velocidadY2;
  
}



void dibujar() {

  stroke(0,0,255);

  background( 127 );
 
  ellipse( posicionX1, posicionY1, radio1 * 2, radio1 * 2 );
  ellipse( posicionX2, posicionY2, radio2 * 2, radio2 * 2 );

  PVector centro = obtenerCentro();
  
  stroke(255,0,0);
  line( posicionX1, posicionY1, centro.x, centro.y );
  
  stroke(0,255,0);
  line( posicionX2, posicionY2, centro.x, centro.y );

  text( obtenerDistancia(), centro.x, centro.y );
  
}


void invertirVelocidades() {

  velocidadX1 *= -1;
  velocidadY1 *= -1;

  velocidadX2 *= -1;
  velocidadY2 *= -1;
  
}





PVector obtenerCentro() {
  
  PVector centro = new PVector(
    ( posicionX1 + posicionX2 ) / 2, 
    ( posicionY1 + posicionY2 ) / 2
  );
 
  return centro;
  
}



float obtenerDistancia() {

  float distancia;

  // 3 distintos metodos:
  // distancia = sqrt( pow( ( posicionX1 - posicionX2 ), 2 ) +  pow( ( posicionY1 - posicionY2 ), 2 ) );
  // distancia = dist( posicionX1, posicionY1, posicionX2, posicionY2 );


  PVector p1, p2;

  p1 = new PVector( posicionX1, posicionY1 );
  p2 = new PVector( posicionX2, posicionY2 );
  
  distancia = PVector.dist( p1, p2 );
  
  return distancia;
  
}


boolean revisarColision() {

  boolean hayColision = false;

  if ( obtenerDistancia() < radio1 + radio2 ) {

    hayColision = true;
  }

  return hayColision;
}





float incremento = 0.5;

void keyPressed() {

  // cambiar dirección:
  if ( key == 'x' || key == 'X') {
    velocidadX1 *= -1;
    velocidadX2 *= -1;
  }
  if ( key == 'y' || key == 'Y') {
    velocidadY1 *= -1;
    velocidadY2 *= -1;
  }


  // alterar velocidad:
  if ( key == '+' ) {
    velocidadX1 += incremento;
    velocidadY1 += incremento;

    velocidadX2 += incremento;
    velocidadY2 += incremento;
  }
  if ( key == '-' ) {
    velocidadX1 -= incremento;
    velocidadY1 -= incremento;

    velocidadX2 -= incremento;
    velocidadY2 -= incremento;
  }
}


void mousePressed() {

  invertirVelocidades();
}