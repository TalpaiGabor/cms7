<!--vámtarifaszám listázása-->
<?php
$className = "Vtsz";
$list = Vtsz::GetBaseList();
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
            $(document).on("click", "#modify_iv", function () {
                var postData = {
                    "class": "Vtsz",
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
        $(document).on("click", ".delete_iv", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Vtsz", "action": "delete", "identifier": {"id": id}};

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
        <tr>
            <th>ID</th>
            <th><?php echo $_SESSION["trans"]["szam"]?></th>
            <th><?php echo $_SESSION["trans"]["afakulcs"]?></th>
            <th><?php echo $_SESSION["trans"]["afamentes"]?></th>
            <th><?php echo $_SESSION["trans"]["forditott_ado"]?></th>
        </tr>
        </thead>
        <tbody>
        <?php
        //adatok kiírása a db-ből
        if($list["result"]){
            foreach($list["result"] as $one){

                ?>
                <tr>
                    <td><?php echo $one["id"]; ?></td>
                    <td><input type="text" class="databaseChange" name="vtsz" value="<?php echo $one["vtsz"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="number" class="databaseChange" name="vat" value="<?php echo $one["vat"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><span class="switch">
                                <input type="checkbox" <?php echo $one["vat_free"]==1?"checked='checked'":"";?> class="databaseChange" name="vat_free"
                                       value="<?php echo $one["vat_free"]; ?>" data-id="<?php echo $one["id"]; ?>"/>
                                <label></label>
                            </span>
                    </td>
                    <td><span class="switch">
                                <input type="checkbox" <?php echo $one["reverse_vat"]==1?"checked='checked'":"";?> class="databaseChange" name="reverse_vat"
                                       value="<?php echo $one["reverse_vat"]; ?>" data-id="<?php echo $one["id"]; ?>"/>
                                <label></label>
                            </span>
                    </td>
                    <td><button id="modify_iv" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete_iv" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
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
    if(isset($_POST["vtsz_add"])){

        $_POST = array_filter($_POST);
        unset($_POST["vtsz_add"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }

        if($_POST["vat_free"]){
            $_POST["vat_free"] = 1;
        }else{
            $_POST["vat_free"] = 0;
        }

        if($_POST["reverse_vat"]){
            $_POST["reverse_vat"] = 1;
        }else{
            $_POST["reverse_vat"] = 0;
        }

        $vtsz_id = Vtsz::add($_POST);

        $vtsz = new Vtsz(array("id" => $vtsz_id));

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
        <input type="text" name="vtsz" placeholder="<?php echo $_SESSION["trans"]["szam"]?>">
        <input type="number" name="vat" placeholder="<?php echo $_SESSION["trans"]["afakulcs"]?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["afamentes"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="vat_free"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["forditott_ado"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="reverse_vat"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <button type="submit" name="vtsz_add"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>

