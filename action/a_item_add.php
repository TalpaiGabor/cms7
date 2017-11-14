<?php

session_name("nubes");
require_once("../include/configuration.php");
require_once ("../include/start.php");

try{
//ha megkapja az adatokat
    if(isset($_POST["add"])){

        $_POST = array_filter($_POST);
        unset($_POST["add"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }

        if($_POST["is_stock"]){
            $_POST["is_stock"] = 1;
        }else{
            $_POST["is_stock"] = 0;
        }

        if($_POST["is_buyable"]){
            $_POST["is_buyable"] = 1;
        }else{
            $_POST["is_buyable"] = 0;
        }

        if($_POST["is_soldable"]){
            $_POST["is_soldable"] = 1;
        }else{
            $_POST["is_soldable"] = 0;
        }

        if($_POST["is_seriesable"]){
            $_POST["is_seriesable"] = 1;
        }else{
            $_POST["is_seriesable"] = 0;
        }

        if($_POST["deleted"]){
            $_POST["deleted"] = 1;
        }else{
            $_POST["deleted"] = 0;
        }

        if($_POST["is_web"]){
            $_POST["is_web"] = 1;
        }else{
            $_POST["is_web"] = 0;
        }

        if($_POST["is_web_action"]){
            $_POST["is_web_action"] = 1;
        }else{
            $_POST["is_web_action"] = 0;
        }

        if($_POST["is_refresh_price_need"]){
            $_POST["is_refresh_price_need"] = 1;
        }else{
            $_POST["is_refresh_price_need"] = 0;
        }

        if($_POST["is_active"]){
            $_POST["is_active"] = 1;
        }else{
            $_POST["is_active"] = 0;
        }

        if($_POST["is_stock_quantityhandling"]){
            $_POST["is_stock_quantityhandling"] = 1;
        }else{
            $_POST["is_stock_quantityhandling"] = 0;
        }



        $item_add = Item::add($_POST);

        $item = new Item(array("id" => $item_add));

        header("Location: ".ROOT_CRM. "items_list/");
        exit();

    }
}catch (MyException $e) {
    $e->storeSessionMessage();
    header("Location: ".ROOT_CRM."items_list/");
    exit();
}

?>
