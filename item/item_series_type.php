<!--sorozat listázása-->
<?php
$className = "Series_type";
$list = Series_type::GetBaseList();
?>

<script>
    $(function () {

        $(document).on("change", ".databaseChange", function () {
            var column = $(this).prop("name");
            var value = $(this).val();
            var id = $(this).data("id");

            if ($(this).is("input[type=checkbox]")) {
                value = $(this).is(":checked") ? 1 : 0;
            }
            $(document).on("click", "#modify_ist", function () {
                var postData = {
                    "class": "Series_type",
                    "action": "update",
                    "data": {},
                    "identifier": {"id": id}
                };
                console.log(postData);
                postData["data"][column] = value;


                $.post("ajax/ajax.php", postData, function (data) {
                    if (!data.success) {
                        $.fancybox.open([data.error]);
                    }
                }, "json");
            });
        });
        $(document).on("click", ".delete_ist", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Series_type", "action": "delete", "identifier": {"id": id}};

            $.post("ajax/ajax.php", postData, function(data){
                if(!data.success){
                    $.fancybox.open([data.error]);
                    return;
                }
                $(input).parents("tr").first().remove();
            }, "json");
        });
    });
</script>
<div class="onerow">
    <table>
        <!-- táblázat fejléc -->
        <thead>
        <th>ID</th>
        <th><?php echo $_SESSION["trans"]["nev"]?></th>
        <th><?php echo $_SESSION["trans"]["torolt"]?></th>
        <th><?php echo $_SESSION["trans"]["torlo_dolgozo"]?></th>
        <th><?php echo $_SESSION["trans"]["torles_datuma"]?></th>
        <th><?php echo $_SESSION["trans"]["modosito_dolgozo_azonosito"]?></th>
        <th><?php echo $_SESSION["trans"]["modositas_datuma"]?></th>
        </thead>
        <tbody>
        <?php
        //adatok kiírása a db-ből
        if($list["result"]){
            foreach($list["result"] as $one){

                ?>
                <tr>
                    <td><?php echo $one["id"]; ?></td>
                    <td><input type="text" class="databaseChange" name="name" value="<?php echo $one["name"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><span class="switch">
                                <input type="checkbox" <?php echo $one["deleted"]==1?"checked='checked'":"";?> class="databaseChange" name="deleted"
                                       value="<?php echo $one["deleted"]; ?>" data-id="<?php echo $one["id"]; ?>"/>
                                <label></label>
                            </span>
                    </td>
                    <td><input type="number" class="databaseChange" name="delete_user_id" value="<?php echo $one["delete_user_id"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="delete_time" value="<?php echo $one["delete_time"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="number" class="databaseChange" name="update_user_id" value="<?php echo $one["update_user_id"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="update_time" value="<?php echo $one["update_time"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><button id="modify_ist" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete_ist" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
                </tr>
                <?php
            }
        }
        ?>
        </tbody>
    </table>
</div>
<?php
try{
    //ha megkapja az adatokat
    if(isset($_POST["series"])){

        $_POST = array_filter($_POST);
        unset($_POST["series"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }

        if($_POST["deleted"]){
            $_POST["deleted"] = 1;
        }else{
            $_POST["deleted"] = 0;
        }

        $series_id = Series_type::add($_POST);

        $series = new Series_type(array("id" => $series_id));

        header("Location: ".ROOT_CRM. "basic_options/");
        exit();

    }
}catch (MyException $e) {
    $e->storeSessionMessage();
    header("Location: ".ROOT_CRM."basic_options/");
    exit();
}

?>

<div class="col4">
    <form method="POST">
        <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["torolt"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="deleted"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <input type="number" name="delete_user_id" placeholder="<?php echo $_SESSION["trans"]["torlo_dolgozo"]?>">
        <input type="datetime-local" name="delete_time" placeholder="<?php echo $_SESSION["trans"]["torles_datuma"]?>">
        <input type="number" name="update_user_id" placeholder="<?php echo $_SESSION["trans"]["modosito_dolgozo_azonosito"]?>">
        <input type="datetime-local" name="update_time" placeholder="<?php echo $_SESSION["trans"]["modositas_datuma"]?>">

        <button type="submit" name="series"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>
