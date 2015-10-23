

// Maquina de estados finitos

final int estadoBienvenida = 0;
final int estadoElegir = 1;
final int estadoJugando = 2;
final int estadoPerdiste = 3;
final int estadoGanaste = 4;
int numEstados = 5;

int estado;



void setup() 
{
  estado = 0;

  size( 1000, 600 );
  
  contador = 0;
}

int contador;

void draw()
{


  contador++;
    contador %= 100;

  if ( contador == 0 ) {
    estado++;
    estado%= numEstados;
  }


  switch( estado ) {

  case estadoBienvenida:
    println("Bienvenida");
    break;

  case estadoElegir:
    println("elegir");
    break;

  case estadoJugando:
    println("Jugando");
    break;

  case estadoPerdiste:
    println("Perdiste");
    break;

  case estadoGanaste:
    println("Ganaste");
    break;
  }
}