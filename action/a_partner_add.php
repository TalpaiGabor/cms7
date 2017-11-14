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

        if($_POST["is_customer"]){
            $_POST["is_customer"] = 1;
        }else{
            $_POST["is_customer"] = 0;
        }

        if($_POST["is_supplier"]){
            $_POST["is_supplier"] = 1;
        }else {
            $_POST["is_supplier"] = 0;
        }

        $partner_id = Partner::add($_POST);

        $partner = new Partner(array("id" => $partner_id));

        header("Location: ".ROOT_CRM. "partners_list/");
        exit();

    }
}catch (MyException $e) {
    $e->storeSessionMessage();
    header("Location: ".ROOT_CRM."partners_list/");
    exit();
}
?>
