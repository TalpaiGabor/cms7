<?php

class Config
{

    public static $root_doc = ROOT_DOC;
    //public static $root_web = "http://localhost/nubes/";

    public static $id;


    public static $php_version_id;

    public static $crm_base_href = "http://localhost/crm7/";

    public static function Init(){

        session_start();

        //DEFINE VARIABLES
        //define("ROOT_WEB", Config::$root_web);
        define("ROOT_CRM", Config::$crm_base_href);
        define("IS_DEVELOPMENT", true);

        define("DB_HOST", "127.0.0.1");
        define("DB_NAME", "root");
        define("DB_PASSWORD", "");
        define("DB_DB_NAME", "nubes_common");
        define("DB_TABLE_SQL_LOG", "");
        define("DB_PREFIX", "");

        if(!isset($_SESSION["partner_id"])) {
            $_SESSION["partner_id"] = null;
        }
        define("PARTNER_ID", $_SESSION["partner_id"]);


        //PHP VERSION
        $version = explode('.', PHP_VERSION);
        Config::$php_version_id = ($version[0] * 10000 + $version[1] * 100 + $version[2]);

        //USABLE TOOLS
        require_once(Config::$root_doc."/include/functions.php");

        //ERROR HANDLING
        ini_set('display_errors', '0');     # don't show any errors...
        error_reporting(E_ALL | E_STRICT);  # ...but do log them

        //LOCALIZATION
        mb_internal_encoding("UTF-8");
        setlocale(LC_ALL, "hu_utf8", "Hungarian_Hungary", "Hungarian");

    }

}

?>