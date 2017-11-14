<!doctype html>
<html style="height:100%;">
<head>
	<meta charset="utf-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	
	<title>Komplex Nubes ERP</title>

	<?php require("include/html_head_resources.php"); ?>
   
</head>

<body style="height:100%;">
    <?php
    //ha be van lépve, megjeleníti a kilépés gombot
    if(LOGIN) {
    ?>
         <form action="login.php" method="POST">
             <button class="col2" type="submit" name="logout" id="logout_button"><?php echo $_SESSION["trans"]["kijelentkezes"];?></button>
         </form>
    <?php
    }
    ?>

<div id="wrapper">
