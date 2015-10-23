#pragma strict

function Start () {

}

function Update () {

}


function OnTriggerEnter( fallingObject : Collider ) {

	if( fallingObject.gameObject.name == "Personaje" )	{
	
	  Application.LoadLevel( Application.loadedLevelName );

	}
   
}