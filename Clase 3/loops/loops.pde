


// int[] arreglo = new int[ 10 ];
// arreglo[ 2 ] = 17;

// int [] arreglo = { 1, 3, 5, 7, 9, 11 };

PVector arreglo [];


PVector origin, tmpOrigin, tmpTarget;

float distanceUnit;

int numSegments = 10;

void setup() {

  size(600, 500);

  arreglo = new PVector[ numSegments ];

  for ( int indice = 0; indice < arreglo.length; indice++ ) {
    arreglo[ indice ] = new PVector( random( -1, 1 ), random( -1, 1 ) );
  } 


  distanceUnit = 200;
}




void draw() {

  background(127);

  origin = new PVector(0, 0);


  for ( int indice = 0; indice < arreglo.length; indice++ ) {

    tmpOrigin = origin.copy();
    tmpOrigin.mult(distanceUnit);
    tmpOrigin.add( width / 2, height / 2 );
    
    tmpTarget = arreglo[indice].copy();
    tmpTarget.mult( distanceUnit );
    tmpTarget.add( width / 2, height / 2 );

    line(
      tmpOrigin.x, 
      tmpOrigin.y, 
      tmpTarget.x, 
      tmpTarget.y
    );

    ellipse( tmpTarget.x, tmpTarget.y, 5, 5 );

    origin = arreglo[ indice ].copy();
    
  }
  
}