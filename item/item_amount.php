<!--mennyiség listázása-->
<?php
$className = "Amount";

//$pid = $_SESSION["amount_id"];

$list = Amount::GetBaseList();

//unset($_SESSION["amount_id"]);
/*$array=array();
if($list["result"]){
    foreach ($list["result"] as $one){
        $obj = new $className(array("id" => $one["id"]));
        $array[$one["id"]] = $obj;
    }
}*/
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
            $(document).on("click", "#modify_ia", function () {
                var postData = {
                    "class": "Amount",
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
        $(document).on("click", ".delete_ia", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Amount", "action": "delete", "identifier": {"id": id}};

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
            <th><?php echo $_SESSION["trans"]["nev"]?></th>
            <th><?php echo $_SESSION["trans"]["leiras"]?></th>
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
                    <td><input type="text" class="databaseChange" name="name" value="<?php echo $one["name"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="description" value="<?php echo $one["description"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><button id="modify_ia" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete_ia" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
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
    if(isset($_POST["amount"])){

        $_POST = array_filter($_POST);
        unset($_POST["amount"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }


        $amount_id = Amount::add($_POST);

        $amount = new Amount(array("id" => $amount_id));

        //header("Location: ".ROOT_CRM. "item_more/?id=".$_SESSION["id"]);
        header("Location: ".ROOT_CRM."basic_options/");
        exit();

    }
}catch (MyException $e) {
    $e->storeSessionMessage();
    //header("Location: ".ROOT_CRM."item_more/?id=".$_SESSION["id"]);
    header("Location: ".ROOT_CRM."basic_options/");
    exit();
}
    ?>


<div class="col4">
    <form method="POST">
        <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]?>">
        <input type="text" name="description" placeholder="<?php echo $_SESSION["trans"]["leiras"]?>">
        <button type="submit" name="amount"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>