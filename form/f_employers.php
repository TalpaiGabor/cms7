<!--dolgozók listázása-->
<br><br><br><br>
<?php
$className="Employer";

echo MyException::messageDisplay();

$list = Employer::GetBaseList();
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
            $(document).on("click", "#modify", function () {
                var postData = {
                    "class": "<?php echo $className;?>",
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
        $(document).on("click", ".delete", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "<?php echo $className;?>", "action": "delete", "identifier": {"id": id}};

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
            <th><?php echo $_SESSION["trans"]["szuletesnap"]?></th>
            <th><?php echo $_SESSION["trans"]["szemelyi_azonosito_szam"]?></th>
            <th><?php echo $_SESSION["trans"]["felhasznalonev"]?></th>
            <th><?php echo $_SESSION["trans"]["alapertelmezett_kifizeto_hely"]?></th>
            <th><?php echo $_SESSION["trans"]["megjegyzes"]?></th>
            <th><?php echo $_SESSION["trans"]["utolso_bejelentkezes"]?></th>
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
                    <td><input type="date" class="databaseChange" name="birth_date" value="<?php echo $one["birth_date"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="number" class="databaseChange" name="id_card_number" value="<?php echo $one["id_card_number"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="username" value="<?php echo $one["username"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="default_pay_office" value="<?php echo $one["default_pay_office"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><input type="text" class="databaseChange" name="comment" value="<?php echo $one["comment"]; ?>"
                               data-id="<?php echo $one["id"]; ?>"/></td>
                    <td><?php echo $one["last_login"]; ?></td>
                    <td><button id="modify" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["modosit"]; ?></button></td>
                    <td><button class="delete" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
                </tr>
                <?php
            }
        }
        ?>
        </tbody>
    </table>
</div>

<?php
try {
    if (isset($_POST["sign"])) {
        $_POST = array_filter($_POST);
        unset($_POST["sign"]);

        $name = $_POST['name'];
        $birth_date = $_POST['birth_date'];
        $id_card_number = $_POST['id_card_number'];
        $username = $_POST['username'];
        $password = $_POST['passwd'];
        $def_pay_office = $_POST['default_pay_office'];
        $comment = $_POST['comment'];

        //error handlers
        //üres mezők

        if (empty($name) || empty($birth_date) || empty($id_card_number) || empty($username) ||
            empty($def_pay_office)) {
            throw new MyException("Hiba! Üresen maradt mező(k)!!");
        } else {
            //input karakterek validak-e
            if (!preg_match("/^[a-zA-Z]*$/", $name) ||
                !preg_match("/^[1-2]([0-9]{3})-(0[1-9]|1[1-2])-([0-2][1-9]|3[01])$/", $birth_date) ||
                !preg_match("/^[0-9]*$/", $id_card_number) ||
                !preg_match("/^[a-zA-Z]*$/", $username) ||
                !preg_match("/^[a-zA-Z]*$/", $def_pay_office) ||
                !preg_match("/^[a-zA-Z]*$/", $comment)) {
                throw new MyException("Hibásan megadott adat!");
            } else {
                //megnézi van-e username egyezés
                $user = Employer::GetBaseList(array("username" => $_POST["username"]));
                if ($user["result"] && count($user["result"])) {
                    throw new MyException("Már van felhasználó ezzel a névvel!");
                }
                
                if(empty($password)){
                    throw new MyException("Hiba! Nem adtál meg jelszót!");
                }else{
                    $_POST["passwd"] = md5($password);
                }
                
                $user_id = Employer::add($_POST);
                
                $user = new $className(array("id" => $user_id));

                header("Location: " . ROOT_CRM. "employers/");
                exit();
            }
        }
    }
} catch (MyException $e) {
    $e->storeSessionMessage();
    header("Location: ".ROOT_CRM."employers/");
    exit();
}
?>
<br><br><br>
<!--felhasználó regisztrációs form-->
<div class="col4">
    <form method="POST">
        <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]?>" value="<?php echo postValue($_SESSION["post"], "name", "text");?>"/>
        <input type="date" name="birth_date" placeholder="<?php echo $_SESSION["trans"]["szuletesnap"]?>" value="<?php echo postValue($_SESSION["post"], "birth_date", "date");?>"/>
        <input type="text" name="id_card_number" placeholder="<?php echo $_SESSION["trans"]["szemelyi_azonosito_szam"]?>" value="<?php echo postValue($_SESSION["post"], "id_card_number", "number");?>"/>
        <input type="text" name="username" placeholder="<?php echo $_SESSION["trans"]["felhasznalonev"]?>" value="<?php echo postValue($_SESSION["post"], "username", "text");?>"/>
        <input type="password" name="passwd" placeholder="<?php echo $_SESSION["trans"]["jelszo"]?>">
        <input type="text" name="default_pay_office" placeholder="<?php echo $_SESSION["trans"]["alapertelmezett_kifizeto_hely"]?>" value="<?php echo postValue($_SESSION["post"], "default_pay_office", "text");?>"/>
        <input type="text" name="comment" placeholder="<?php echo $_SESSION["trans"]["megjegyzes"]?>" value="<?php echo postValue($_SESSION["post"], "comment", "text");?>"/>
        <button type="submit" name="sign"><?php echo $_SESSION["trans"]["regisztracio"];?></button>
    </form>
</div>