<?php
	session_name("nubes");
    define('__ROOT__', dirname(__FILE__));
    require(__ROOT__.'/include/configuration.php');
    //require("include/configuration.php");


    require_once("include/start.php");


    //bejelentkezes action
    if(isset($_POST["submit"])){
        $POST = array_filter($_POST);
        try{
            $uid = $POST['uid'];
            $pwd = $POST['pwd'];
            $db = $POST["db"];
            $_SESSION["partner_id"] = $db;


            $_SESSION["post"] = $_POST;

            $className="Com_company";
            $obj = new $className(array("id" => $db));


            $_SESSION["db"] = (array)$obj;


            $__DAO = null;

            $__DAO = new DAO();


            //error handlers
            //üres inputok
            if(empty($uid) || empty($pwd)){
                throw new MyException("Hiba! Üresen maradt az egyik mező!");
            }else{
                if(isset($uid) && isset($pwd) && Employer::login($uid, $pwd)){

                    //$_SESSION["partner_id"] = null;

                    $user = new Employer(array("username" => $uid));
                    $_SESSION["user"] = (array)$user;
                    Employer::AfterLogin($user->id);
                    header("Location: ".ROOT_CRM."index.php");
                    exit();
                }else{
                    $_SESSION["partner_id"] = null;
                    throw new MyException("Hiba! Rossz jelszó!");
                }
            }
        }catch(MyException $ex){
            $ex->storeSessionMessage();
        }

        header("Location: ".ROOT_CRM);
        exit();
    }

    //kijelentkezes action
    if(isset($_POST["logout"])){
        try{
            Employer::logout();
        }catch(MyException $ex){
            $ex->storeSessionMessage();
        }

        header("Location: " . ROOT_CRM);
        exit();
    }


	if(LOGIN){
        header('Location: ' . ROOT_CRM);
	}


	require("template/head.php");

	//kiírja a hibaüzenetet
	echo MyException::messageDisplay();
?>

    <a href="http://www.mhzq.com">logó helye</a>

    <?php
    $className="Com_company";
    $list=$className::GetBaseList();
    array_unique($list);
    ?>

    <div class="onerow center-text">
    <div class="col3">
        <form action="" method="POST">
            <h1><?php echo $_SESSION["trans"]["bejelentkezes"];?></h1>
            <h1>Válaszd ki az adatbázist</h1>
            <label>
                <select name="db">
                    <?php foreach ($list["result"] as $one) { ?>
                        <option value="<?php echo $one["id"]; ?>"><?php echo $one["name"]?> </option>
                    <?php } ?>
                </select>
            </label>
            <input type="text" name="uid" placeholder="<?php echo $_SESSION["trans"]["felhasznalonev"]?>" value="<?php echo postValue($_SESSION["post"], "uid", "text");?>"/>
            <input type="password" name="pwd" placeholder="<?php echo $_SESSION["trans"]["jelszo"]?>">
            <button type="submit" name="submit"><?php echo $_SESSION["trans"]["belepes"];?></button>
        </form>
    </div>
    </div>


<?php 
	require("template/footer.php");
?>