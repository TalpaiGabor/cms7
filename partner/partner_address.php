<!--címek listázása-->
<?php
    $className = "Partner_address";
    $pid = $_SESSION["id"];
    $list = Partner_address::GetBaseList(array("partner_id" => $pid));
    $array=array();
    if($list["result"]){
        foreach ($list["result"] as $one){
            $obj = new $className(array("id" => $one["id"]));
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
            $(document).on("click", "#modify_pa", function () {
                var postData = {
                    "class": "Partner_address",
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
        $(document).on("click", ".delete_pa", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Partner_address", "action": "delete", "identifier": {"id": id}};

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
if($array){
    foreach ($array as $one){ ?>
        <div class="onerow">
            <p><?php echo $i.". ".$_SESSION["trans"]["cimadat"]; ?></p>
            <div class="col6">
                <table>
                    <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><label><?php echo $one->id; ?></label></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["nev"];?></td>
                        <td><input type="text" class="databaseChange" name="name" value="<?php echo $one->name; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["tipus"];?></td>
                        <td><input type="text" class="databaseChange" name="name" value="<?php echo $one->type; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["orszag_azonosito"];?></td>
                        <td><input type="number" class="databaseChange" name="country_id" value="<?php echo $one->country_id; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["orszag"];?></td>
                        <td><input type="text" class="databaseChange" name="country_id" value="<?php echo $one->country; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["zip_kod"];?></td>
                        <td><input type="text" class="databaseChange" name="zip_code" value="<?php echo $one->zip_code; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["varos"];?></td>
                        <td><input type="text" class="databaseChange" name="city" value="<?php echo $one->city; ?>"
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
                        <td><?php echo $_SESSION["trans"]["korzet"];?></td>
                        <td><input type="text" class="databaseChange" name="district" value="<?php echo $one->district; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["kozterulet_neve"];?></td>
                        <td><input type="text" class="databaseChange" name="street" value="<?php echo $one->street; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["tipus"];?></td>
                        <td><input type="text" class="databaseChange" name="address_attribute" value="<?php echo $one->address_attribute; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["szam"];?></td>
                        <td><input type="text" class="databaseChange" name="number" value="<?php echo $one->number; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["epulet"];?></td>
                        <td><input type="text" class="databaseChange" name="building" value="<?php echo $one->building; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["lepcsohaz"];?></td>
                        <td><input type="number" class="databaseChange" name="staircase" value="<?php echo $one->staircase; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["szint"];?></td>
                        <td><input type="number" class="databaseChange" name="building_level" value="<?php echo $one->building_level; ?>"
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
                        <td><?php echo $_SESSION["trans"]["ajto"];?></td>
                        <td><input type="number" class="databaseChange" name="door" value="<?php echo $one->door; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["szelesseg"];?></td>
                        <td><input type="number" class="databaseChange" name="latitude" value="<?php echo $one->latitude; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["hosszusag"];?></td>
                        <td><input type="number" class="databaseChange" name="longitude" value="<?php echo $one->longitude; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col6 last">
                <table>
                    <tbody>
                    <tr>
                        <td>status id</td>
                        <td><input type="number" class="databaseChange" name="status_id" value="<?php echo $one->status_id; ?>"
                                   data-id="<?php echo $one->id; ?>"/></td>
                    </tr>
                    </tbody>
                </table>
                <div class="onerow">
                    <div class="col3">
                        <button id="modify_pa"><?php echo $_SESSION["trans"]["modosit"]; ?></button>
                    </div>
                    <div class="col3 last">
                        <button class="delete_pa" data-id="<?php echo $one->id; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button></td>
                    </div>
                </div>

            </div>
        </div>
<?php
        $i++;
        }
    }else{
        echo "Nincsenek címadatok megadva ehhez a partnerhez!";
}

try{
    //ha megkapja az adatokat
    if(isset($_POST["address"])){

        $_POST = array_filter($_POST);
        unset($_POST["address"]);

        if(empty($_POST)){
            throw new MyException("Nem adtál meg adatokat!");
        }


        $partner_id = Partner_address::add($_POST);

        $partner = new Partner_address(array("id" => $partner_id));

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
<form method="post">
            <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]; ?>">
            <input type="text" name="type" placeholder="<?php echo $_SESSION["trans"]["tipus"]; ?>">
            <input type="number" name="country_id" placeholder="<?php echo $_SESSION["trans"]["orszag_azonosito"]; ?>">
            <input type="text" name="country" placeholder="<?php echo $_SESSION["trans"]["orszag"]; ?>">
            <input type="number" name="zip_code" placeholder="<?php echo $_SESSION["trans"]["zip_kod"]; ?>">
            <input type="text" name="city" placeholder="<?php echo $_SESSION["trans"]["varos"]; ?>">
            <input type="text" name="district" placeholder="<?php echo $_SESSION["trans"]["korzet"]; ?>">
            <input type="text" name="street" placeholder="<?php echo $_SESSION["trans"]["kozterulet_neve"]; ?>">
            <input type="text" name="address_attribute" placeholder="<?php echo $_SESSION["trans"]["tipus"]; ?>">
            <input type="text" name="number" placeholder="<?php echo $_SESSION["trans"]["szam"]; ?>">
            <input type="text" name="building" placeholder="<?php echo $_SESSION["trans"]["epulet"]; ?>">
            <input type="number" name="staircase" placeholder="<?php echo $_SESSION["trans"]["lepcsohaz"]; ?>">
            <input type="number" name="building_level" placeholder="<?php echo $_SESSION["trans"]["szint"]; ?>">
            <input type="number" name="door" placeholder="<?php echo $_SESSION["trans"]["ajto"];?>">
            <input type="number" name="latitude" placeholder="<?php echo $_SESSION["trans"]["szelesseg"]; ?>">
            <input type="number" name="longitude" placeholder="<?php echo $_SESSION["trans"]["hosszusag"]; ?>">
            <input type="number" name="status_id" placeholder="status_id">
            <input type="number" name="partner_id" placeholder="partner_id">
            <button type="submit" name="address"><?php echo $_SESSION["trans"]["regisztracio"]; ?></button>
</form>
</div>
