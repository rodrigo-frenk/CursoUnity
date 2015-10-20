class Ball {

  PVector position, speed;
  
  float radius;
  
  float mass;
  
  Ball() {
    
    position = new PVector();
    speed = new PVector();
    
  }

  
  
  void setPosition( float x, float y ) {
    position.set( x, y );
  }
  
  void setPosition( PVector _position ) {
    position = _position.copy();
  }
  
  void setPositionX( float x ) {
    position.x = x;
  }
  void setPositionY( float y ) {
    position.y = y;
  }
  
  PVector getPosition() {
    return position;
  }
  
  
  
  
  void setSpeed( float x, float y ) {
    speed.set( x, y );
  }
  
  void setSpeed( PVector _speed ) {

    speed = _speed.copy();

  }
  
  void setSpeedX( float x ) {
    speed.x = x;
  }
  void setSpeedY( float y ) {
    speed.y = y;
  }
  
  PVector getSpeed() {
    return speed;
  }
   
   
   
     
  void setMass( float _mass ) {
    mass = _mass;
  }
  float getMass() {
    return mass;
  }
     
      

     
  void setRadius( float _radius ) {
    radius = _radius;
  }
  float getRadius() {
    return radius;
  }
  
      
      
  void animate() {
    position.add( speed );
  }
  
  void show() {
    ellipse( position.x, position.y, radius * 2, radius * 2);
  }

  

   

};