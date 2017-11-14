<?php

DEFINE("LOGIN", isset($_SESSION["user"]["id"]));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	
	
    $formId = trim(strip_tags(basename($_SERVER["PHP_SELF"])));
	
	if(isset($_POST["formId"])){
		$formId = $_POST["formId"];
	}
	
    $actionFile = 'action/a_' . $formId . ".php";

	
    if (file_exists($actionFile)) {
        require_once $actionFile;
				
	    header('Location: ' . $_SERVER['HTTP_REFERER']);
	    exit();
    }

  
}


// Elso latogatas eseten lokalizalas
//if(!$_SESSION["first_visit"]){
	$trans = $__DAO->getRows("SELECT translate.unique_name, translate_lang.text FROM translate_lang 
		LEFT JOIN translate ON translate.id = translate_lang.translate_id
		WHERE lang_id = ?", array(1));

	
	if($trans){
		foreach($trans as $oneTrans){
			$_SESSION["trans"][$oneTrans["unique_name"]] = $oneTrans["text"];
		}
	}
        
        
        
        //var_dump($_SESSION["trans"]["afakulcs"]);
        //exit();
	$_SESSION["first_visit"] = false;
//}




?>