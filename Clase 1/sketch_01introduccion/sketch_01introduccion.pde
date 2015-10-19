
// Funciones


// funcion que no regresa datos:

void una_funcion() {
  
  String texto = "hacer algo";
  println( texto );

}

// funciones con tipo de dato

int dame_un_numero_dos() {
  
  return 2;

}


String dame_una_palabra() {
  return "Hola";
}





int sumar_numeros( int num1, int num2 ) {
  return num1 + num2;
}


void setup() {
  
  
  una_funcion();

  println( dame_un_numero_dos() );

  println( dame_una_palabra() );
  

  int variable_numero = 10;
  println( sumar_numeros( variable_numero, 17 ) );
  
  
  


}

void loop() {}