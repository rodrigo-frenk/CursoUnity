#pragma strict

var script : UnityStandardAssets.Utility.SmoothFollow;
var mainCamera : GameObject;

var selected : int;
function Start () {
		mainCamera = GameObject.Find("Main Camera");
		script = mainCamera.GetComponent("SmoothFollow");
		selected = 0;
}




function Update () {

	if( Input.GetButtonDown("Fire1") ) {
	

		if( selected % 2 == 0 )
		script.target = GameObject.Find("Personaje").transform;
		
		if( selected % 2 == 1 )
		script.target = GameObject.Find("CuboQueCae").transform;
		
		selected++;

	}
	
	if( Input.GetButtonDown("Fire2") ) {

		script.height++;
	}

			
}