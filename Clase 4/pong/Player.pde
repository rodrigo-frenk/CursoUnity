class Player {

  // método constructor:
  String name;
  int points;
  int totalWonGames;
  
  float position;
  
  Player() {
    
    name = "unidentified";
    
    points = 0;
    totalWonGames = 0;
    position = 0.5;
    
  }
  
  
  
  void addPoint() {
    points++;
  }
  
  void setPoints( int _points ) {
    points = _points;
  }
  int getPoints() {
    return points;
  }
  
  
  
  
  void addTotalWonGames() {
    totalWonGames++;
  }
  
  void setTotalWonGames( int _totalWonGames ) {
    totalWonGames = _totalWonGames;
  }
  int getTotalWonGames() {
    return totalWonGames;
  }
  
  
  
  void setName( String _name ) {
    name = _name;
  }
  
  String getName() {
    return name;
  }
  
  
  void setPosition( float _position ) {

    if( _position > 1 ) {
      position = 1;
    } else if( _position < 0 ) {
      position = 0;
    } else {        
      position = _position;
    }
    
  }
  
  float getPosition() {
    return position;
  }
  
}