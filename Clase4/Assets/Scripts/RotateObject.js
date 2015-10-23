#pragma strict

public var speed : float;

function Start () {
	speed = 100;
}

function Update () {


	transform.Rotate(Vector3.left, Time.deltaTime * speed );

}