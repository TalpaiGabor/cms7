<!--csomagolás listázása-->
<?php
$className = "Package";
$list = Package::GetBaseList();
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
            $(document).on("click", "#modify_ip", function () {
                var postData = {
                    "class": "Package",
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
        $(document).on("click", ".delete_ip", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Package", "action": "delete", "identifier": {"id": id}};

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
            <th><?php echo $_SESSION["trans"]["jel"]?></th>
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
                    <td><input type="text" class="databaseChange" name="sign" value="<?php echo $one["sign"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><button id="modify_ip" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete_ip" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
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
    if(isset($_POST["package"])){

        $_POST = array_filter($_POST);
        unset($_POST["package"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }


        $package_id = Package::add($_POST);

        $package = new Package(array("id" => $package_id));

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
        <input type="text" name="sign" placeholder="<?php echo $_SESSION["trans"]["jel"]?>">
        <button type="submit" name="package"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>