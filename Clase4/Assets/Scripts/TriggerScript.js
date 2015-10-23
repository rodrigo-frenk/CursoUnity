#pragma strict

function Start () {

}

function Update () {

}



function OnTriggerEnter() {

	Destroy( GameObject.Find("Prize") );

}


function OnTriggerExit() {

	Debug.Log("Exit trigger!");

}



function OnTriggerStay() {

	Debug.Log("Stay on trigger!");

}