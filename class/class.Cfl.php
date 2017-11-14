<?php

class Cfl extends AbstractData
{

    public function getDataTable($class, $name){
        ob_start();

        try{

            //az item táblából kikeressük az aktuális azonosítójú elemet
            $item = Item::GetBaseList(array("id" => $_SESSION["id"]));

            //lekéri a szükséges táblából az összes adatot
            $list = $class::GetBaseList();

            echo $class;

            //objekumokat hoz létre az adatbáziselemekből, és egy tömbben eltárolja
            $array=array();
            if($list["result"]){
                foreach ($list["result"] as $one){
                    $obj = new $class(array("id" => $one["id"]));
                    $array[$one["id"]] = $obj;
                }
            }else{
                throw new MyException("Nincs ilyen tábla az adatbázisban");
            }
            

            //a cikk módosítandó adatának értékét eltárolja egy session változóban
            if($item["result"]){
                foreach ($item["result"] as $one){
                    $keys = array_keys($one);
                    foreach ($keys as $key) {
                        if ($key == $name) {
                            $_SESSION["cfl_id"] = $one[$name];
                        }
                    }
                }
            }else{
                throw new MyException("Nincs ilyen azonostóval bejegyezve cikk az adatbázisba");
            }

            foreach ($array as $one) {
                if ($_SESSION["item_modify"] == true) {
                    ?>
                    <table>
                        <tr>
                            <td>
                                <?php
                                if ($name == "vtsz") {
                                    ?>
                                    <label><?php echo $one->vtsz; ?></label>
                                    <input type="radio" name="<?php echo $name ?>" class="databaseChange"
                                           data-id="<?php echo $_SESSION["id"] ?>" <?php echo $_SESSION["cfl_id"] == $one->vtsz ? "checked='checked'" : ""; ?>
                                           value="<?php echo $one->vtsz; ?>"/>
                                    <?php
                                } else {
                                    ?>
                                    <label><?php echo $one->id; ?></label>
                                    <input type="radio" name="<?php echo $name ?>" class="databaseChange"
                                           data-id="<?php echo $_SESSION["id"] ?>" <?php echo $_SESSION["cfl_id"] == $one->id ? "checked='checked'" : ""; ?>
                                           value="<?php echo $one->id; ?>"/>
                                <?php } ?>
                            </td>
                        </tr>
                    </table>
                    <?php
                }else{
                    ?>
                    <table>
                        <tr>
                            <td>
                                <?php
                                if ($name == "vtsz") {
                                    ?>
                                    <label><?php echo $one->vtsz; ?></label>
                                    <input type="radio" name="<?php echo $name ?>" class="ok"
                                           value="<?php echo $one->vtsz; ?>" data-value="<?php echo $one->vtsz; ?>"/>
                                    <?php
                                } else {
                                    ?>
                                    <label><?php echo $one->id; ?></label>
                                    <input type="radio" name="<?php echo $name ?>" class="ok"
                                           value="<?php echo $one->id; ?>" data-value="<?php echo $one->id; ?>"/>
                                <?php } ?>
                            </td>
                        </tr>
                    </table>
                    <?php
                }
            }
            if($_SESSION["item_modify"] == true) {
                ?>
                <button id="modify_i"
                        data-id="<?php echo $_SESSION["cfl_id"]; ?>"><?php echo $_SESSION["trans"]["modosit"]; ?></button>
                <?php
            }else{
                ?>
                <button id="ok">OK</button>
                <?php
            }
        }catch (MyException $e){
            $e-storeSessionMessage();
        }

        $content = ob_get_contents();
        ob_end_clean();
        return $content;
    }

}