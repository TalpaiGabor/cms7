<?php
    session_name("nubes");
	
    require("include/configuration.php");
    require_once("include/start.php");
if(!LOGIN){
    header('Location: ' . ROOT_CRM.'login.php');
    exit();
}
    ob_start();
    require("template/head.php");
    require ("template/menu.php");

?>
<?php
    //echo messageDisplay($_SESSION["msg"]);
	
	//echo $_SESSION["trans"]["sikeres_regisztracio"];
	
if(isset($_GET["form"]) && file_exists("form/f_".$_GET["form"].".php")){
    require("form/f_".$_GET["form"].".php");
}

    $_content = ob_get_contents();
    ob_clean();
    echo $_content;
?>

<?php

    require_once("template/footer.php");
?>