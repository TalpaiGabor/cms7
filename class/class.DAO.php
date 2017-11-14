<?php
class DAO
{
    private $host, $name, $password, $db_name;
    private $db;


    public function __construct()
    {

        if($_SESSION["partner_id"] == null) {
            $this->host = DB_HOST;
            $this->name = DB_NAME;
            $this->password = DB_PASSWORD;
            $this->db_name = DB_DB_NAME;
        }else{
            $this->host = $_SESSION["db"]["db_source"];
            $this->name = $_SESSION["db"]["db_user"];
            $this->password = $_SESSION["db"]["db_password"];
            $this->db_name = $_SESSION["db"]["db_name"];
        }
        try {
            // Kapcsolódás az adatbázishoz.
            $this->db = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->name, $this->password);

            $this->db->query("SET CHARACTER SET 'utf8'");
            $this->db->query("SET COLLATION_CONNECTION='utf8_general_ci'");
            $this->db->query("SET character_set_results = 'utf8_general_ci'");
            $this->db->query("SET character_set_server = 'utf8'");
            $this->db->query("SET character_set_client = 'utf8'");
            $this->db->exec("USE ".$this->db_name);
        } catch (PDOException $e) {
            $params[0] = $this->host;
            $params[1] = $this->db;
            $params[2] = $this->name;
            $params[3] = $this->password;
            echo "Error when try connecting to database" . $e->getMessage();
        }
    }




    public function getRow($query, $params = array()){
        try{
            $stmt = $this->db->prepare($query);
            $stmt->execute($params);

            // LOG
            //$this->errorLog($query, $params, "getRow() metódus lekérdezés");
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }

    }

    public function getRowNumeric($query, $params = array()){
        try{
            $stmt = $this->db->prepare($query);
            $stmt->execute($params);

            // LOG
            //$this->errorLog($query, $params, "getRow() metódus lekérdezés");
            return $stmt->fetch(PDO::FETCH_COLUMN);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }

    }

    public function getRows($query, $params = array()){
        try{
            $stmt = $this->db->prepare($query);
            $stmt->execute($params);

            // LOG
            //$this->errorLog($query, $params, "getRows() metódus lekérdezés");
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function getRowsNumeric($query, $params = array()){
        try{
            $stmt = $this->db->prepare($query);
            $stmt->execute($params);

            // LOG
            //$this->errorLog($query, $params, "getRows() metódus lekérdezés");
            return $stmt->fetchAll(PDO::FETCH_COLUMN);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function insertRow($query, $params){
        try{
            $stmt = $this->db->prepare($query);
            $stmt->execute($params);
            return $this->getConn()->lastInsertId();
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());

        }
    }

    public function updateRow($query, $params){
        try{
            $stmt = $this->db->prepare($query);

            return $stmt->execute($params);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function updateRows($query, $params){
        try{
            if(!(is_array($params[0]))){
                $oneParam = $params;
                throw new PDOException("Second parameter is not two dimensional array!");
            }
            foreach($params as $oneParam){

                $stmt = $this->db->prepare($query);
                $stmt->execute($oneParam);

            }
        }catch(PDOException $e){
            $this->errorLog($query, $oneParam, $e->getMessage());
        }
    }

    public function deleteRow($query, $params){
        try {
            $stmt = $this->db->prepare($query);
            return $stmt->execute($params);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function deleteRows($query, $params){
        try {

            foreach($params as $oneParam){
                echo $oneParam;
                $stmt = $this->db->prepare($query);
                $stmt->bindParam(1, $oneParam);
                $stmt->execute();

            }
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function getReferenceToThisTable($tableName){
        try{
            $stmt = $this->db->prepare("SELECT TABLE_NAME, COLUMN_NAME FROM `information_schema`.`KEY_COLUMN_USAGE`
WHERE `REFERENCED_TABLE_NAME` LIKE '".$tableName."'");
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function getReferencedTables($tableName){
        try{
            $stmt = $this->db->prepare("SELECT REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME FROM `information_schema`.`KEY_COLUMN_USAGE`
WHERE `REFERENCED_TABLE_NAME` IS NOT NULL AND `TABLE_NAME` LIKE '".$tableName."'");
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function getIdName($tableName){
        try{
            $stmt = $this->db->prepare("SHOW KEYS FROM ".$tableName." WHERE Key_name = 'PRIMARY'");
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result["Column_name"];
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }
    }

    public function getColumnNames($tableName){
        try{
            $stmt = $this->db->prepare("SHOW COLUMNS FROM ".$tableName);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        }catch(PDOException $e){
            $this->errorLog($query, $params, $e->getMessage());
        }

    }

    private function errorLog($query, $params, $errorCode){
        $SQL_insertSQLLog = "INSERT INTO ".DB_TABLE_SQL_LOG."(`sql_query`, `error_code`) VALUES(?, ?)";
        $query = DAO::replaceAskMarks($query, $params);
        try{
            $stmt = $this->db->prepare($SQL_insertSQLLog);
            $stmt->bindParam(1, $query);
            $stmt->bindParam(2, $errorCode);
            $stmt->execute();
        }catch(PDOException $e){
            echo "Error at LOG:".$e->getMessage();
        }
    }

    public function getConn(){
        return $this->db;
    }

    public static function replaceAskMarks($query, $params){
        foreach($params as $oneParam){
            $query = preg_replace("/\?/", $oneParam, $query, 1);
        }
        return $query;
    }

}
?>