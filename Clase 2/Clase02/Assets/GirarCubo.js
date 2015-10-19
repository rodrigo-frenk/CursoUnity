#pragma strict


var spinIncrement : float;

function Start () {
	spinIncrement = 0.1;
}

function Update () {

	transform.Rotate( 0, spinIncrement, 0 );

//	if( transform.rotation.y > 0.9 ) {
	if( transform.eulerAngles.y > 350 ) {
		spinIncrement *= -1;
	}
	
}