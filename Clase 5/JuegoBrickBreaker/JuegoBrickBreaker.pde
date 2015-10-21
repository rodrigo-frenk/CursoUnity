import controlP5.*;



// Maquina de estados finitos

final int estadoBienvenida = 0;
final int estadoElegir = 1;
final int estadoJugando = 2;
final int estadoPerdiste = 3;
final int estadoGanaste = 4;
int numEstados = 5;

int estado;
int dificultad;
PFont font;

ControlP5 cp5;
RadioButton r;

void setup() 
{
  estado = 1;

  size( 1000, 600 );

  contador = 0;

  font = createFont("Cabin-Bold.ttf", 32);
  textFont(font);

  cp5 = new ControlP5( this );
  cp5.setFont( font );

  r = cp5.addRadioButton("dificultad");
  r.setPosition(width/2 - 380, height/2 + 100);
  r.setItemsPerRow( 3 );
  r.setSize( 50, 50 ).setSpacingColumn( 250 ).setSpacingRow( 10 );
  r.addItem("facil",0).addItem("intermedio",1).addItem("dificil",2);
  r.toggle(0);

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
    textoEstado = "Bienvenida";
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;

  case estadoElegir:
    textoEstado = "Elegir";
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    r.show();
    break;

  case estadoJugando:
    println("Jugando");
    textoEstado = "Jugando";
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;


  case estadoPerdiste:
    println("Perdiste");
    textoEstado = "Perdiste";
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;



  case estadoGanaste:
    textoEstado = "Ganaste";
    text( textoEstado, width/2 - textWidth(textoEstado)/2, height/2);
    break;


  }
  
}

void controlEvent(ControlEvent theEvent){

  if(theEvent.isFrom(r)){
  dificultad = int(theEvent.getValue());
  estado++;
  r.hide();
  }

}