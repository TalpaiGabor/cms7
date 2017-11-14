<!--kontakt listázása-->
<?php
    $className = "Partner_contact";
    $pid = $_SESSION["id"];
    $list = Partner_contact::getBaseList(array("partner_id" => $pid));
    $array=array();
    if($list["result"]){
        foreach ($list["result"] as $one){
            $obj = new $className(array("id" => $one["id"]));
            $full_name = Partner_contact::name($obj->last_name, $obj->first_name, $obj->middle_name);
            $obj->name = $full_name;
            $array[$one["id"]] = $obj;
        }
    }
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
            $(document).on("click", "#modify_pc", function () {
                var postData = {
                    "class": "Partner_contact",
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
        $(document).on("click", ".delete_pc", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Partner_contact", "action": "delete", "identifier": {"id": id}};

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
<?php
$i=1;
if($array) {
    foreach ($array as $one) { ?>
        <div class="onerow">
            <p><?php echo $i . ". " . $_SESSION["trans"]["elerhetoseg"]; ?></p>
            <div class="col6">
                <table>
                    <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><label><?php echo $one->id; ?></label></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["nev"]; ?></td>
                        <td><input type="text" class="databaseChange" name="name" value="<?php echo $one->name; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["keresztnev"]; ?></td>
                        <td><input type="text" class="databaseChange" name="first_name"
                                   value="<?php echo $one->first_name; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["vezeteknev"]; ?></td>
                        <td><input type="text" class="databaseChange" name="last_name"
                                   value="<?php echo $one->last_name; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["kozepso_nev"]; ?></td>
                        <td><input type="text" class="databaseChange" name="middle_name"
                                   value="<?php echo $one->middle_name; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["munkakori_azonosito"]; ?></td>
                        <td><input type="number" class="databaseChange" name="feor_id"
                                   value="<?php echo $one->feor_id; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="onerow">
            <div class="col6">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["partner_azonosito"]; ?></td>
                        <td><input type="number" class="databaseChange" name="partner_id"
                                   value="<?php echo $one->partner_id; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["telefon"]; ?></td>
                        <td><input type="number" class="databaseChange" name="phone" value="<?php echo $one->phone; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["mobiltelefonszam"]; ?></td>
                        <td><input type="number" class="databaseChange" name="mobile_phone"
                                   value="<?php echo $one->mobile_phone; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["fax"]; ?></td>
                        <td><input type="number" class="databaseChange" name="fax" value="<?php echo $one->fax; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["e_mail"]; ?></td>
                        <td><input type="text" class="databaseChange" name="email" value="<?php echo $one->email; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="onerow">
            <div class="col6">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["megjegyzes"]; ?></td>
                        <td><input type="text" class="databaseChange" name="commnt" value="<?php echo $one->commnt; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["orszag_azonosito"]; ?></td>
                        <td><input type="number" class="databaseChange" name="country_id"
                                   value="<?php echo $one->country_id; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["szamlaszam"]; ?></td>
                        <td><input type="text" class="databaseChange" name="default_bill"
                                   value="<?php echo $one->default_bill; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
                <div class="onerow">
                    <div class="col3">
                        <button id="modify_pc"><?php echo $_SESSION["trans"]["modosit"]; ?></button>
                    </div>
                    <div class="col3 last">
                        <button class="delete_pc" data-id="<?php echo $one->id; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
                    </div>
                </div>

            </div>
        </div>
    <?php }
}else{
    echo "Nincsenek kontakt adatok a partnerhez megadva";
}

try{
    //ha megkapja az adatokat
    if(isset($_POST["contact"])){

        $_POST = array_filter($_POST);
        unset($_POST["contact"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }


        $partner_id = Partner_contact::add($_POST);

        $partner = new Partner_contact(array("id" => $partner_id));

        header("Location: ".ROOT_CRM. "partner_more/?id=".$_SESSION["id"]);
        exit();

    }
}catch (MyException $e) {
    $e->storeSessionMessage();
    header("Location: ".ROOT_CRM."partner_more/?id=".$_SESSION["id"]);
    exit();
}
?>

<br><br><br>
<div class="col4">
    <form method="post" action="action/a_partner_contact_add.php">
        <input type="text" name="first_name" placeholder="<?php echo $_SESSION["trans"]["keresztnev"]; ?>">
        <input type="text" name="last_name" placeholder="<?php echo $_SESSION["trans"]["vezeteknev"]; ?>">
        <input type="text" name="middle_name" placeholder="<?php echo $_SESSION["trans"]["kozepso_nev"]; ?>">
        <input type="number" name="feor_id" placeholder="<?php echo $_SESSION["trans"]["munkakori_azonosito"]; ?>">
        <input type="number" name="partner_id" placeholder="<?php echo $_SESSION["trans"]["partner_azonosito"]; ?>">
        <input type="number" name="phone" placeholder="<?php echo $_SESSION["trans"]["telefon"]; ?>">
        <input type="number" name="mobile_phone" placeholder="<?php echo $_SESSION["trans"]["mobiltelefonszam"]; ?>">
        <input type="number" name="fax" placeholder="<?php echo $_SESSION["trans"]["fax"]; ?>">
        <input type="text" name="email" placeholder="<?php echo $_SESSION["trans"]["e_mail"]; ?>">
        <input type="text" name="commnt" placeholder="<?php echo $_SESSION["trans"]["megjegyzes"]; ?>">
        <input type="text" name="passwd" placeholder="<?php echo $_SESSION["trans"]["jelszo"]; ?>">
        <input type="number" name="country_id" placeholder="<?php echo $_SESSION["trans"]["orszag_azonosito"]; ?>">
        <input type="text" name="default_bill" placeholder="<?php echo $_SESSION["trans"]["szamlaszam"]; ?>">
        <button type="submit" name="contact"><?php echo $_SESSION["trans"]["regisztracio"]; ?></button>
    </form>
</div>
