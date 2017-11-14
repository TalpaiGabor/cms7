<?php
class MyException extends Exception {

    protected $id;
    protected $message_type;


    public function __construct($message, $lang_id = 1, $message_type = "error",  $code = 0, Exception $previous = null){
        global $__DAO;
		
		$unique_name = toAscii($message);
		
		if(IS_DEVELOPMENT){
			$res = $__DAO->insertRow("INSERT INTO exception(name, unique_name, message_type) VALUES(?,?,?) ON DUPLICATE KEY UPDATE message_type = VALUES(message_type), id = LAST_INSERT_ID(id)", array($message, $unique_name, $message_type));
			
			if($res){
				$lang_list = $__DAO->getRows("SELECT * FROM lang");
				
				foreach($lang_list as $one){
					
					$__DAO->insertRow("INSERT INTO exception_lang(message, lang_id, exception_id) VALUES(?,?,?) ON DUPLICATE KEY UPDATE message = VALUES(message), id = LAST_INSERT_ID(id)", array($message, $one["id"], $res));
				}
				
			}
			
		} else {
			$q = "SELECT ex.message, e.message_type FROM exception_lang as ex
				LEFT JOIN exception as e on e.id = exception_lang.exception_id
				WHERE e.unique_name = ?";
			$res = $__DAO->getRow($q, array($unique_name));
			if($res){
				$message_type = $message_type;
				$message = $res["message"];
			}
		}
		$this->message_type = $message_type;
		 parent::__construct($message, $code, $previous);
    }

    public function storeSessionMessage(){
		
        $_SESSION["msg"]["class"] = $this->message_type;
        $_SESSION["msg"]["msg"] = $this->getMessage();
		
		
    }
	
	public static function storeSessionMessageStatic($type, $message){
		$_SESSION["msg"]["class"] = $type;
                $_SESSION["msg"]["msg"] = $message;
	}
	
	public static function messageDisplay(){
		
		ob_start();
		ob_clean();
			
			$msg = $_SESSION["msg"];
			
			if(isset($msg)){
				?>
					<div class="<?php echo $msg["class"];?>-wrapper">
						<div class="close">
							<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
								 <line x1="0" y1="0" x2="100" y2="100"></line>
								 <line x1="0" y1="100" x2="100" y2="0"></line>
							</svg>
						</div>
						<div class="<?php echo $msg["class"];?>"><?php echo $msg["msg"];?></div>
					</div>
				<?php
			}
		$content = ob_get_contents();
		ob_clean();
		unset($_SESSION["msg"]);
		return $content;
	}


    public function getMsg(){
        return $this->message;
    }

}


?>