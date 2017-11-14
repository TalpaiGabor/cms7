<?php

DEFINE("ROOT_DOC", str_replace("\\","/", dirname(dirname(__FILE__))));
spl_autoload_register(function($className){
    $classFile = ROOT_DOC.'/class/class.' . $className . '.php';

    if (file_exists($classFile)) { require_once $classFile; }
});


Config::Init();

if(isset($__DAO)) {
    $__DAO = null;
    $__DAO = new DAO();
}else{
    $__DAO = new DAO();
}


?>