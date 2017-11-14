<?php
	if(isset($_SESSION["msg"])){
		unset($_SESSION["msg"]);
	}
	if(isset($_SESSION["post"])){
		unset($_SESSION["post"]);
	}if(isset($_SESSION["statistics"])){
		unset($_SESSION["statistics"]);
	}

?>