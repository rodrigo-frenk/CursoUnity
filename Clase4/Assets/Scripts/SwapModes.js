#pragma strict


private var script : UnityStandardAssets.Utility.SmoothFollow;
private var animator : Animator;

function Start () {
	script = GetComponent("SmoothFollow");
	animator = GetComponent("Animator");
}

function Update () {
}


function AnimationEnded() {	


	script.enabled = true;
	animator.enabled = false;

}