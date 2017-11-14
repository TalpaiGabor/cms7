<?php class AbstractData{

    function __construct()
    {
        global $__DAO;
        $args = func_get_args();
        $values = $args[0];
        $property = array_keys($values);

        $values = array_values($values);

        $className = get_class($this);


        if(!$property || !$values){
            throw new Exception($className." doesn't has property called ".$property);
        }



        AbstractData::checkProperty($className, $property);

        if(is_array($property)){
            $property = implode(" = ? AND ", $property);
        }


        $db_table = strtolower($className);

        $property .= " = ?";
        $q = "SELECT * FROM ".DB_PREFIX.$db_table." WHERE ".$property;



        if(is_array($values)){
            $params = $values;
        } else {
            $params = array($values);
        }


        $obj = $__DAO->getRows($q, $params);
        if(count($obj) > 1){
            throw new Exception("Query returns more than one row");
        } else if (count($obj) == 0){
            throw new Exception("Query returns 0 row");

        }
        foreach($obj[0] as $property => $oneValue){
            if(property_exists($className, $property)){
                $this->$property = $oneValue;
            }
        }

    }


    public static function checkProperty($className, $property){
        if(is_array($property)){
            foreach($property as $one){
                if(!property_exists($className, $one)){
                    throw new Exception($className." doesn't has property called ".$one);
                }
            }


        } else if(!property_exists($className, $property)){
            throw new Exception($className." doesn't has property called ".$property);
        }
    }

    public static function add($data){
        global $__DAO;

        $className = strtolower(get_called_class());

        AbstractData::checkProperty($className, array_keys($data));

        $db_table = strtolower($className);

        $asks='';
        //'?,?' formulát állít elő az inserthez
        $asks = str_pad($asks, count($data)*2, "?,", STR_PAD_RIGHT);
        $asks = rtrim($asks, ",");
        $q = "INSERT INTO ".DB_PREFIX.$db_table."(".implode(",",array_keys($data)).") VALUES (".$asks.")";


        //az utolsó beszúrt id-vel tér vissza
        if($__DAO->insertRow($q, array_values($data))){
            return $__DAO->getConn()->lastInsertId();
        }
        return false;

    }

    public static function delete($data){
        global $__DAO;
        $className = strtolower(get_called_class());
        AbstractData::checkProperty($className, array_keys($data));

        $db_table = strtolower($className);

        $where = "WHERE 1 ";

        foreach($data as $key => $value){
            $where .= "AND ".$key." = ? ";
        }

        $q = "DELETE FROM ".DB_PREFIX.$db_table." ".$where;
        return $__DAO->deleteRow($q, array_values($data));
    }

    public static function update($update, $identifier){
        global $__DAO;
        $className = strtolower(get_called_class());
		
		
		
        AbstractData::checkProperty($className, array_keys($update));
        AbstractData::checkProperty($className, array_keys($identifier));

        $db_table = strtolower($className);

        $set = "";

        $params = array();

        foreach($update as $key => $value){
            $set .= $key." = ?,";
            $params[] = $value;
        }
        $set = rtrim($set, ",");
        $set .= " ";

        $where = "WHERE 1 ";

        foreach($identifier as $key => $value){
            $where .= "AND ".$key." = ? ";
            $params[] = $value;
        }

        $q = "UPDATE ".DB_PREFIX.$db_table." SET ".$set.$where;



        return $__DAO->updateRow($q, $params);
    }

    public static function GetBaseList($search_params = array(), $pagination = array(), $order_by = array()){
        global $__DAO;
        $className = strtolower(get_called_class());

        AbstractData::checkProperty($className, array_keys($order_by));


        $query = "SELECT * FROM ".DB_PREFIX.$className." ";

        $where = " WHERE 1";
        $params = array();

        if(is_array($search_params)){
            foreach($search_params as $column => $value){
                if($column == "search_text"){
                    if(!method_exists($className, 'GetSearchProperties')){
                        throw new Exception($className." doesn't has method like GetSearchProperties");
                    }

                    $search_columns = $className::GetSearchProperties();

                    if($search_columns){
                        $where_search = " AND ( ";
                        foreach($search_columns as $oneSearch){
                            $where_search .= $oneSearch." LIKE CONCAT( '%', ? '%') OR ";
                            $params[] = $search_params["search_text"];

                        }
                        $where_search = rtrim($where_search, "OR ");
                        $where_search .= " ) ";

                        $where .= $where_search;
                    }

                    unset($search_params["search_text"]);
                    continue;
                }

                $operator = "=";
                if(strpos($column, "|") !== false){
                    $column = explode($column);
                    $operator = $column[1];
                    $column = $column[0];
                }
                AbstractData::checkProperty($className, $column);
                $where .= " AND ".$column." ".$operator." ?";
                $params[] = $value;

            }

            //$params = array_merge($params, array_values($search_params));
        }

        $query .= "".$where;

        $result_list = $__DAO->getRows($query, $params);


        if(count($order_by)){
            $order = " ORDER BY ";
            foreach($order_by as $key => $value){
                $order .= $key." ".$value.",";
            }
            $order = rtrim($order, ",");
            $order .= " ";
        } else if(!empty($order_by)){
            switch($order_by){
                case "random":
                    $order = "ORDER BY RAND() ";
                    break;
            }

        }

        $limit = "";
        if($pagination){
            if(array_key_exists("hits_per_page", $pagination)){
                $limit = " LIMIT ";
                $hits_per_page = $pagination["hits_per_page"];
                $page = 0;
                if(array_key_exists("page", $pagination)){
                    $page = $pagination["page"] - 1;
                }

                $page = $page * $hits_per_page;
                $limit .= $page.",".$hits_per_page;
            }
        }

        $query .= $order.$limit;

        $result = array(
            "result_all_num" => count($result_list),
            "result" => $__DAO->getRows($query, $params)
        );

        return $result;
    }

    public static function GetDataType(){
        global $__DAO;
        $data = array();
        $className = strtolower(get_called_class());
        $data_type = $__DAO->getRows("SELECT DATA_TYPE, COLUMN_NAME, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, DATETIME_PRECISION, COLUMN_TYPE, COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_name = ? ", array(DB_PREFIX.$className));

        foreach($data_type as &$oneType){
            $value = "";

            if($oneType["COLUMN_KEY"] == "PRI"){
                continue;
            }
            /*$input = new Input();
            $input->name = $oneType["COLUMN_NAME"];
            $input->id = $className."_".$oneType["COLUMN_NAME"].$data["id"];

            $type = InputType::text;*/
            $properties = array();
            if($oneType["NUMERIC_PRECISION"] > 0){

                ////Ha számokról van szó

                //$type = InputType::number;
                /*switch($oneType["COLUMN_TYPE"]){
                    case "tinyint(1)":
                        $type = InputType::checkbox;
                        break;
                }*/

                switch($oneType["DATA_TYPE"]){
                    case "float":
                        $properties["step"] = "0.1";
                        break;
                    case "decimal":
                        $properties["step"] = "0.".str_pad("0", $oneType["NUMERIC_SCALE"])."1";
                }
            } else {

                //Ha szövegről van szó

                /*switch($oneType["COLUMN_NAME"]){
                    case "password":
                        $type = InputType::password;
                        break;
                }

                switch($oneType["DATA_TYPE"]){
                    case "datetime":
                        $type = InputType::datetime;
                        break;
                }*/

                $properties["maxLength"] = $oneType["CHARACTER_MAXIMUM_LENGTH"];

            }

            /*$input->type = $type;
            $input->value = $value;
            $input->properties = $properties;

            $oneType["input"] = $input;*/
        }

        return $data_type;
    }

    public static function CreateDefaultForm($placeholders = array(), AbstractData $data = NULL){
        global $__DAO;
        ob_start();

        $data = (array)$data;
        $className = strtolower(get_called_class());
        $data_type = $__DAO->getRows("SELECT DATA_TYPE, COLUMN_NAME, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, DATETIME_PRECISION, COLUMN_TYPE, COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_name = ? ", array(DB_PREFIX.$className));


        foreach($data_type as $oneType){
            $value = "";
            if($data[$oneType["COLUMN_NAME"]]){
                $value = $data[$oneType["COLUMN_NAME"]];
            }

            if($oneType["COLUMN_KEY"] == "PRI"){
                continue;
            }
            $input = new Input();
            $input->name = $oneType["COLUMN_NAME"];
            $input->id = $className."_".$oneType["COLUMN_NAME"].$data["id"];
            if(isset($data["id"])){
                $input->id .= $data["id"];
            }
            $type = InputType::text;
            $properties = array();
            if($oneType["NUMERIC_PRECISION"] > 0){

                ////Ha számokról van szó

                $type = InputType::number;
                switch($oneType["COLUMN_TYPE"]){
                    case "tinyint(1)":
                        $type = InputType::checkbox;
                        break;
                }

                switch($oneType["DATA_TYPE"]){
                    case "float":
                        $properties["step"] = "0.1";
                        break;
                    case "decimal":
                        $properties["step"] = "0.".rtrim(str_pad("0", $oneType["NUMERIC_SCALE"]))."1";
                }
            } else {

                //Ha szövegről van szó

                switch($oneType["COLUMN_NAME"]){
                    case "password":
                        $type = InputType::password;
                        break;
                }

                $properties["maxLength"] = $oneType["CHARACTER_MAXIMUM_LENGTH"];

            }

            $input->type = $type;
            $input->value = $value;
            $input->properties = $properties;

            if(array_key_exists($oneType["COLUMN_NAME"], $placeholders)){
                $input->placeholder = $placeholders[$oneType["COLUMN_NAME"]];
            }
            echo $input->Show();

        }

        $content = ob_get_contents();
        ob_clean();
        return $content;


    }

    public static function GetSearchProperties(){
        $properties = array();
        if(property_exists(get_called_class(), "name")){
            $properties[] = name;
        }
        return $properties;
    }

}

?>