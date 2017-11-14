<?php class Employer extends AbstractData {

    public $id;
    public $name;
    public $birth_date;
    public $id_card_number;
    public $username;
    public $passwd;
    public $default_pay_office;
    public $comment;
    public $last_login;

    public static function login($uid, $pwd){
        global $__DAO;
        
        $q = "SELECT passwd FROM ".DB_PREFIX."employer WHERE username = ?";

        $user = $__DAO->getRow($q, array($uid));
        if($user["passwd"] == md5($pwd)){
            return true;
        } else {
            return false;
        }
    }

    public static function logout(){
        unset($_SESSION['user']);
        $_SESSION["partner_id"] = null;
    }
    
    //bejelentkezéskor frissíti az utolsó bejelentkezés időpontját
    public static function AfterLogin($user_id){
        if(isset($_SESSION["user"])) {
            Employer::update(array("last_login" => date("Y-m-d H:i:s")), array("id" => $user_id));
        }
    }
  
}

?>