#pragma strict

var speed : float;

function Start () {
	speed = 3;

}

function Update () {

	transform.Translate(
		Input.GetAxis("Horizontal") * Time.deltaTime * speed,
		0,
		Input.GetAxis("Vertical") * Time.deltaTime * speed
	);


}