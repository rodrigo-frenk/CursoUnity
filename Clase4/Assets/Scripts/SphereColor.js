#pragma strict


public var waitTime : float = 5f;

private var red : float;
private var green : float;
private var blue : float;
private var alpha : float;

private var sphereCollider : Collider;



function Start () {
//	sphereCollider = GetComponent.<Collider>();
	sphereCollider = GetComponent("Collider");

	NewColor();

	Destroy( gameObject, 2 );

}


function FixedUpdate() {

	waitTime -= Time.deltaTime;
	
	if( waitTime <= 0.0f ) {
		GetComponent.<Renderer>().material.color = Color.blue;
	}
	
	
	if( Input.GetKey( KeyCode.N ) ) {
	
		NewColor();
		
		waitTime = 3f;

	}



	
	if( Input.GetKey( KeyCode.C ) ) {
	
		sphereCollider.enabled = ! sphereCollider.enabled;

	}


	if( Input.GetKey( KeyCode.D ) ) {
	
		Destroy( gameObject );
		
	}

}



function RandomColorValue () {

	var randomValue : float;
	randomValue = Random.Range(0.000,1.000);
	return randomValue;
	
}




function NewColor() {
	red = RandomColorValue();
	green = RandomColorValue();
	blue = RandomColorValue();
	alpha = RandomColorValue();
	GetComponent.<Renderer>().material.color = Color( red, green, blue, alpha );
}



function OnMouseDown() {

	NewColor();

}