<?php
    $className = "Partner";
    $obj = new $className(array("id" => $_GET["id"]));
    $_SESSION["id"] = $_GET["id"];
    echo MyException::messageDisplay();
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
                });
            </script>

            <div class="onerow">
                <div class="col6">
                    <table>
                        <tbody>
                        <tr>
                            <td>ID</td>
                            <td><label><?php echo $obj->id; ?></label></td>
                        </tr>
                            <td><?php echo $_SESSION["trans"]["nev"]; ?></td>
                            <td><input type="text" class="databaseChange" name="name" value="<?php echo $obj->name; ?>"
                                       data-id="<?php echo $_GET["id"]; ?>"/></td>
                        <tr>
                        <td><?php echo $_SESSION["trans"]["vasarlo"]; ?></td>
                            <td>
                            <span class="switch">
                                <input type="checkbox" <?php echo $obj->is_customer==1?"checked='checked'":"";?> class="databaseChange" name="is_customer"
                                       value="<?php echo $obj->is_customer; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["szallito"]; ?></td>
                            <td>
                            <span class="switch">
                                <input type="checkbox" <?php echo $obj->is_supplier==1?"checked='checked'":"";?> class="databaseChange" name="is_supplier"
                                       value="<?php echo $obj->is_supplier; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col6 last">
                    <table>
                        <tbody>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["telefon"]; ?></td>
                            <td><input type="number" class="databaseChange" name="phone"
                                       value="<?php echo $obj->phone; ?>" data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["e_mail"]; ?></td>
                            <td><input type="text" class="databaseChange" name="email"
                                       value="<?php echo $obj->email; ?>" data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                            <td><?php echo $_SESSION["trans"]["weboldal"]; ?></td>
                            <td><input type="text" class="databaseChange" name="web" value="<?php echo $obj->web; ?>"
                                       data-id="<?php echo $_GET["id"]; ?>"/></td>
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
                            <td><?php echo $_SESSION["trans"]["fizetesi_mod"]; ?></td>
                            <td><input type="number" class="databaseChange" name="pay_mode"
                                       value="<?php echo $obj->pay_mode; ?>" data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["kedvezmeny"]; ?></td>
                            <td><input type="text" class="databaseChange" name="discount"
                                       value="<?php echo $obj->pay_mode; ?>" data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["kesedelmi_kamat"]; ?></td>
                            <td><input type="text" class="databaseChange" name="late_charges"
                                       value="<?php echo $obj->late_charges; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col6 last">
                    <table>
                        <tbody>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["ceg_regisztracios_szam"]; ?></td>
                            <td><input type="number" class="databaseChange" name="company_registration_number"
                                       value="<?php echo $obj->company_registration_number; ?>"
                                       data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["szemelyi_azonosito_szam"]; ?></td>
                            <td><input type="number" class="databaseChange" name="id_card_number"
                                       value="<?php echo $obj->id_card_number; ?>"
                                       data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["anyja_neve"]; ?></td>
                            <td><input type="text" class="databaseChange" name="mothers_name"
                                       value="<?php echo $obj->mothers_name; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
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
                            <td><?php echo $_SESSION["trans"]["szuletesi_hely"]; ?></td>
                            <td><input type="text" class="databaseChange" name="birth_city"
                                       value="<?php echo $obj->birth_city; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["szuletesnap"]; ?></td>
                            <td><input type="date" class="databaseChange" name="birth_date"
                                       value="<?php echo $obj->birth_date; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td>recipient</td>
                            <td><input type="text" class="databaseChange" name="recipient"
                                       value="<?php echo $obj->recipient; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>


                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col6 last">
                    <table>
                        <tbody>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["kedvezmenyes_ado"]; ?></td>
                            <td><input type="text" class="databaseChange" name="recipient_tax"
                                       value="<?php echo $obj->recipient_tax; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["szamlaszam"]; ?></td>
                            <td><input type="text" class="databaseChange" name="bill_email"
                                       value="<?php echo $obj->bill_email; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $_SESSION["trans"]["megjegyzes"]; ?></td>
                            <td><input type="text" class="databaseChange" name="commnt"
                                       value="<?php echo $obj->commnt; ?>" data-id="<?php echo $_GET["id"]; ?>"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="onerow">
                        <div class="col3">
                            <button id="modify"><?php echo $_SESSION["trans"]["modosit"]; ?></button>
                        </div>
                    </div>
                </div>


            </div>
            <!--jquery tabs a partnerekhez-->
            <div id="tabs">
                <ul>
                    <li>
                        <a href="partner_more/?id=<?php echo $_GET["id"]; ?>#tabs-1"><?php echo $_SESSION["trans"]["cimek"]; ?></a>
                    </li>
                    <li>
                        <a href="partner_more/?id=<?php echo $_GET["id"]; ?>#tabs-2"><?php echo $_SESSION["trans"]["elerhetoseg"]; ?></a>
                    </li>
                </ul>
                <div id="tabs-1">
                    <?php require_once("partner/partner_address.php"); ?>
                </div>
                <div id="tabs-2">
                    <?php require_once("partner/partner_contact.php");?>
                </div>
            </div>