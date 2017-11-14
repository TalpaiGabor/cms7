<?php
// session beállítások importálása
	session_name("nubes");
 require_once("../include/configuration.php");
 require_once("../include/start.php");
 //var_dump($_SESSION["user"]);
	// try{
		// $user = new User(array("id" => $_SESSION["user"]["id"]));
	// }
	// catch(Exception $e){
		// header("Location: ".ROOT_WEB);
	// }
 
header('Content-type: text/plain; charset=utf-8');
$data = array(
		"success" => false,
		"error" => "",
		"data" => array()
	);
//var_dump($_SESSION["user"]);
if(isset($_POST["class"])){
	$className = $_POST["class"];
	$action = $_POST["action"];
	
	try{
		switch($action){
			case "insert":
				$add = $_POST["data"];
				$data["success"] = $className::add($add);
			break;
			case "update":
				$identifier = $_POST["identifier"];
				$update = $_POST["data"];
				$data["success"] = $className::update($update, $identifier);
			break;
			case "delete":
				$identifier = $_POST["identifier"];
				$data["success"] = $className::delete($identifier);
			break;
			case "select":
				$search_params = isset($_POST["search_params"])?$_POST["search_params"]:array();
				$pagination = isset($_POST["pagination"])?$_POST["pagination"]:array();
				$order_by = isset($_POST["order_by"])?$_POST["order_by"]:array();
				$data["data"] = $className::GetBaseList($search_params, $pagination, $order_by);
				
				$data["success"] = true;
			break;
			case "upload":
				if(method_exists($className, $_POST["method"])){
					
					$data["data"] = forward_static_call_array(array($className, $_POST["method"]), array($_FILES["file"]["tmp_name"], $_POST["size"]));
					ob_clean();
					$data["success"] = $data["data"]?true:false;
					
				} else {
					throw new Exception($className." doesn't have method called: ". $_POST["method"]);
				}
			break;
			case "method":
				if(method_exists($className, $_POST["method"])){
					$data["data"] = forward_static_call_array(array($className, $_POST["method"]), $_POST["data"]);
					$data["success"] = $data["data"]?true:false;
					
				} else {
					throw new Exception($className." doesn't have method called: ". $_POST["method"]);
				}
			break;
			
		}
	}catch(Exception $e){
		$data["error"] = $e->getMessage();
	}
	
}


 
// if(isset($_POST["queryString"])){
	


	// $q = stripslashes($_POST["queryString"]);
	// $result = mysql_query($q);
	
	
	
	
	// if(strpos(strtolower($q), "select") !== false){
		// if($result){
			// $data["success"] = true;
			// while($d = mysql_fetch_assoc($result)){
				// $data["data"][] = $d;
			// }
		// }
		
		// if($result === false){
			// $data["success"] = false;
			// $data["error"] = "error during SELECT";
		// }
	// }
	// else if(strpos(strtolower($q), "insert") !== false){
		
		
		// if($result === false){
			// $data["success"] = false;
			// $data["error"] = "error during INSERT";
		// } else {
			// $data["data"] = mysql_insert_id();
			// $data["success"] = true;
		// }
	// }else if(strpos(strtolower($q), "delete") !== false){
		
		// if($result === false){
			// $data["success"] = false;
			// $data["error"] = "error during DELETE";
		// } else {
			// $data["success"] = true;
		// }
	// } else {
		
		// if($result === false){
			// $data["success"] = false;
			// $data["error"] = "error during UPDATE";
		// } else{
			// $data["success"] = true;
		// }
	// }


// }
echo json_encode($data);

?>
