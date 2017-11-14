<?php
function getVar($variable, $key){
	if(is_array($variable) && array_key_exists($key, $variable)){
		return $variable[$key];
	}
	return NULL;
}

function toAscii($str, $replace = array(), $delimiter = '_') {
    if (!empty($replace)) {
        $str = str_replace((array) $replace, ' ', $str);
    }
	
    
	$ekezetes = array(' ','Á','É','Í','Ó','Ö','&#213;','Ú','Ü','&#219;','á','é','í','ó','ö','&#245;','ú','ü','&#251;','ű','Ű ','Ő','ő','lő','ű');
$ekezettelen = array('_','a','e','i','o','o','o','u','u','u','a','e','i', 'o','o','o','u','u','u','u','U','o','o','u');
$clean = strtolower(str_replace($ekezetes, $ekezettelen, $str));
	$clean = iconv('UTF-8', 'ASCII//TRANSLIT', $clean);
	
    $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
    $clean = strtolower(trim($clean, '_'));
	
    $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);

    return $clean;
}

function removeHtmlTags($text){
	return preg_replace("/<\/?((?!>)(.))+>/", " ", $text);
}

function returnBytes ($val)
    {
        if(empty($val))return 0;

        $val = trim($val);

        preg_match('#([0-9]+)[\s]*([a-z]+)#i', $val, $matches);

        $last = '';
        if(isset($matches[2])){
            $last = $matches[2];
        }

        if(isset($matches[1])){
            $val = (int) $matches[1];
        }

        switch (strtolower($last))
        {
            case 'g':
            case 'gb':
                $val *= 1024;
            case 'm':
            case 'mb':
                $val *= 1024;
            case 'k':
            case 'kb':
                $val *= 1024;
        }

        return (int) $val;
    }

function getUniqueId(){
	if(PHP_VERSION_ID >= 50300){
		$bytes = openssl_random_pseudo_bytes(4);
		$hex   = bin2hex($bytes);
	} else{
		$hex = uniqid();
		$hex = substr($hex, 0, 8);
	}
	return $hex;
}

function messageDisplay($msg){
	ob_start();
	ob_clean();
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
	return $content;
}

function postValue($post, $name, $type, $value = ""){
	if(!$post){
		return;
	}
	ob_start();
	if(array_key_exists($name, $post) ){
		
		switch($type){
			case "select" : 
				if($post[$name] == $value){
					echo "selected='selected'";
				}
			break;
			case "checkbox" : 
				if($post[$name]){
					echo "checked='checked'";
				}
			break;
			case "text":
				echo $post[$name];
			break;
			case "number":
				echo $post[$name];
			break;
			case "hidden":
				echo $post[$name];
			break;
		}
		
	} else {
		echo "";
	}
	$content = ob_get_contents();
	ob_clean();
	return $content;
}
?>