<!--partnerek listázása-->
<div id="search">keresés</div>
<br><br><br>
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
                    "class": "Partner",
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
            var postData = {"class" : "Partner", "action": "delete", "identifier": {"id": id}};

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
<div class="scroller">
<?php
    $list = Partner::GetBaseList();

    echo MyException::messageDisplay();
?>

    <table>
        <thead>
        <th>ID</th>
        <th><?php echo $_SESSION["trans"]["nev"]?></th>
        <th><?php echo $_SESSION["trans"]["weboldal"]?></th>
        <th><?php echo $_SESSION["trans"]["megtekintes"]?></th>
        <th><?php echo $_SESSION["trans"]["torles"]?></th>
        </thead>
    <tbody>
    <?php
    //id alapján növekvő sorrendben kilistázza az adatokat, a bővebben gombra kattintva az adott id-t átviszi
    if($list["result"]){
        foreach($list["result"] as $one){
            ?>
    <form method="GET" action="partner_more/">
            <tr>
                <td><?php echo $one["id"]; ?></td>
                <td><?php echo $one["name"]; ?></td>
                <td><?php echo $one["web"]; ?></td>
                <td>
                    <div class="onerow">
                        <div class="col3">
                            <button type="submit" name="id" value="<?php echo $one["id"];?>"><?php echo $_SESSION["trans"]["bovebben"];?></button>
                        </div>
                    </div>
                </td>
    </form>
                <td>
                    <div class="onerow">
                        <div class="col3">
                            <button class="delete" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button>
                        </div>
                    </div>
                </td>
            </tr>
            <?php
        }
    }
    ?>
    </tbody>
    </table>

</div>


<!--partnerek hozzáadása form-->
<br><br><br><br>
<div class="col4">
<form method="POST" action="action/a_partner_add.php">
    <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]; ?>">
    <table>
        <tr>
            <td><?php echo $_SESSION["trans"]["vasarlo"]; ?></td>
            <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_customer"><label></label>
                </span>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td><?php echo $_SESSION["trans"]["szallito"]; ?></td>
            <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_supplier"><label></label>
                </span>
            </td>
        </tr>
    </table>
    <input type="number" name="phone" placeholder="<?php echo $_SESSION["trans"]["telefon"]; ?>">
    <input type="email" name="email" placeholder="<?php echo $_SESSION["trans"]["e_mail"]; ?>">
    <input type="text" name="web" placeholder="<?php echo $_SESSION["trans"]["weboldal"]; ?>">
    <input type="number" name="fax" placeholder="<?php echo $_SESSION["trans"]["fax"]; ?>">
    <input type="number" name="pay_mode" placeholder="<?php echo $_SESSION["trans"]["fizetesi_mod"]; ?>">
    <input type="text" name="discount" placeholder="<?php echo $_SESSION["trans"]["kedvezmeny"]; ?>">
    <input type="text" name="late_charges" placeholder="<?php echo $_SESSION["trans"]["kesedelmi_kamat"]; ?>">
    <input type="number" name="company_registration_number" placeholder="<?php echo $_SESSION["trans"]["ceg_regisztracios_szam"]; ?>">
    <input type="number" name="id_card_number" placeholder="<?php echo $_SESSION["trans"]["szemelyi_azonosito_szam"]; ?>">
    <input type="text" name="mothers_name" placeholder="<?php echo $_SESSION["trans"]["anyja_neve"]; ?>">
    <input type="text" name="birth_city" placeholder="<?php echo $_SESSION["trans"]["szuletesi_hely"]; ?>">
    <input type="text" name="birth_date" placeholder="<?php echo $_SESSION["trans"]["szuletesnap"]; ?>">
    <input type="text" name="recipient" placeholder="Recipient">
    <input type="text" name="recipient_tax" placeholder="<?php echo $_SESSION["trans"]["kedvezmenyes_ado"]; ?>">
    <input type="text" name="bill_email" placeholder="<?php echo $_SESSION["trans"]["szamlaszam"]; ?>">
    <input type="text" name="comment" placeholder="<?php echo $_SESSION["trans"]["megjegyzes"]; ?>">
    <button type="submit" name="add"><?php echo $_SESSION["trans"]["regisztracio"]; ?></button>
</form>
</div>