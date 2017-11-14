<!--valuta listázása-->
<?php
$className = "Currency";

$list = Currency::GetBaseList();

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
            $(document).on("click", "#modify_ic", function () {
                var postData = {
                    "class": "Currency",
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
        $(document).on("click", ".delete_ic", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Currency", "action": "delete", "identifier": {"id": id}};

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
        <th><?php echo $_SESSION["trans"]["arfolyam"]?></th>
        <th><?php echo $_SESSION["trans"]["kerekites"]?></th>
        <th><?php echo $_SESSION["trans"]["tizedesjegy"]?></th>
        <th><?php echo $_SESSION["trans"]["leiras"]?></th>
        <th><?php echo $_SESSION["trans"]["vegkerekites"]?></th>
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
                    <td><input type="number" class="databaseChange" name="exchange_price" value="<?php echo $one["exchange_price"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="correction" value="<?php echo $one["correction"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="decimal_place" value="<?php echo $one["decimal_place"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="description" value="<?php echo $one["description"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><span class="switch">
                                <input type="checkbox" <?php echo $one["end_correction"]==1?"checked='checked'":"";?> class="databaseChange" name="end_correction"
                                       value="<?php echo $one["end_correction"]; ?>" data-id="<?php echo $one["id"]; ?>"/>
                                <label></label>
                            </span>
                    </td>
                    <td><button id="modify_ic" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete_ic" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
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
    if(isset($_POST["currency"])){

        $_POST = array_filter($_POST);
        unset($_POST["currency"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }

        if($_POST["end_correction"]){
            $_POST["end_correction"] = 1;
        }else{
            $_POST["end_correction"] = 0;
        }

        $currency_id = Currency::add($_POST);

        $currency = new Currency(array("id" => $currency_id));

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
        <input type="number" name="exchange_price" placeholder="<?php echo $_SESSION["trans"]["arfolyam"]?>">
        <input type="text" name="correction" placeholder="<?php echo $_SESSION["trans"]["kerekites"]?>">
        <input type="number" name="decimal_place" placeholder="<?php echo $_SESSION["trans"]["tizedesjegy"]?>">
        <input type="text" name="description" placeholder="<?php echo $_SESSION["trans"]["leiras"]?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["vegkerekites"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="end_correction"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <button type="submit" name="currency"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>