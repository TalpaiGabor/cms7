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
            $(document).on("click", "#modify_i", function () {
                var postData = {
                    "class": "Item",
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

        $(document).on("click", ".delete_i", function(){
            var input = $(this);
            var id = input.data("id");
            if(!confirm("Biztosan törli?")){
                return;
            }
            var postData = {"class" : "Item", "action": "delete", "identifier": {"id": id}};

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
    $_SESSION["item_modify"] = false;

    $list = Item::GetBaseList();
    echo MyException::messageDisplay();
    ?>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th><?php echo $_SESSION["trans"]["cikkszam"]?></th>
                <th><?php echo $_SESSION["trans"]["nev"]?></th>
                <th><?php echo $_SESSION["trans"]["arlistas_ar"]?></th>
                <th><?php echo $_SESSION["trans"]["megtekintes"]?></th>
                <th><?php echo $_SESSION["trans"]["torles"]?></th>
            </tr>
            </thead>
            <tbody>
            <?php
            //id alapján növekvő sorrendben kilistázza az adatokat, a bővebben gombra kattintva az adott id-t átviszi
            if($list["result"]){
                foreach($list["result"] as $one){
                    ?>
            <form method="GET" action="item_more/">
                    <tr>
                        <td><?php echo $one["id"]; ?></td>
                        <td><?php echo $one["code"]; ?></td>
                        <td><?php echo $one["name"]; ?></td>
                        <td><?php echo $one["out_price"]; ?></td>
                        <td>
                            <div class="onerow">
                                <div class="col4">
                                    <button type="submit" name="id" value="<?php echo $one["id"];?>"><?php echo $_SESSION["trans"]["bovebben"];?></button>
                                </div>
                            </div>
                        </td>
            </form>
                        <td>
                            <div class="onerow">
                                <div class="col4">
                                    <button class="delete_i" data-id="<?php echo $one["id"]; ?>" ><?php echo $_SESSION["trans"]["torles"]; ?></button>
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

<br><br><br><br>
<div class="col4">
    <form method="POST" action="action/a_item_add.php">
        <input type="text" name="code" placeholder="<?php echo $_SESSION["trans"]["cikkszam"]; ?>">
        <input type="text" name="name" placeholder="<?php echo $_SESSION["trans"]["nev"]; ?>">
        <input type="text" name="vtsz" class="cfl" data-name="vtsz" data-cfl_class="Vtsz" placeholder="<?php echo $_SESSION["trans"]["szam"]; ?>">
        <input type="number" name="amount_id" data-name="amount_id" class="cfl" data-cfl_class="Amount" placeholder="<?php echo $_SESSION["trans"]["mennyisegi_egyseg_azonosito"]; ?>">
        <input type="number" name="min_stock_qty" placeholder="<?php echo $_SESSION["trans"]["minimum_mennyiseg_figyeles_raktaron"]; ?>">
        <input type="number" name="in_price" placeholder="<?php echo $_SESSION["trans"]["aktualis_beszerzesi_ar"]; ?>">
        <input type="number" name="currency_id" data-name="currency_id" class="cfl" data-cfl_class="Currency" placeholder="<?php echo $_SESSION["trans"]["deviza"]; ?>">
        <input type="text" name="comment" placeholder="<?php echo $_SESSION["trans"]["megjegyzes"]; ?>">
        <input type="number" name="sold_amount" data-name="sold_amount" class="cfl" data-cfl_class="Amount" placeholder="<?php echo $_SESSION["trans"]["eladasi_mennyisegi_egyseg"]; ?>">
        <input type="number" name="amount_exchange_number" placeholder="<?php echo $_SESSION["trans"]["mennyisegi_valtoszam"]; ?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["keszletezheto"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_stock"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["beszerezheto"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_buyable"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["eladhato"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_soldable"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <input type="text" name="cash_register_name" placeholder="<?php echo $_SESSION["trans"]["penztargep_nev"]; ?>">
        <input type="number" name="out_price" placeholder="<?php echo $_SESSION["trans"]["arlistas_ar"]; ?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["sorszamkezeles"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_seriesable"><label></label>
                </span>
                </td>
            </tr>
        </table>
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
        <input type="number" name="series_type_id" data-name="series_type_id" class="cfl" data-cfl_class="Series_type" placeholder="<?php echo $_SESSION["trans"]["sorszam_kezeles_tipus_azonosito"]; ?>">
        <input type="text" name="delete_time" placeholder="<?php echo $_SESSION["trans"]["torles_datuma"]; ?>">
        <input type="number" name="delete_user_id" placeholder="<?php echo $_SESSION["trans"]["torlo_dolgozo"]; ?>">
        <input type="text" name="update_time" placeholder="<?php echo $_SESSION["trans"]["modositas_datuma"]; ?>">
        <input type="number" name="update_user_id" placeholder="<?php echo $_SESSION["trans"]["modosito_dolgozo_azonosito"]; ?>">
        <input type="number" name="container_unit" placeholder="<?php echo $_SESSION["trans"]["kiszerelesi_egyseg"]; ?>">
        <input type="text" name="print_type" placeholder="<?php echo $_SESSION["trans"]["nyomtatvanytipus"]; ?>">
        <input type="number" name="weight" placeholder="<?php echo $_SESSION["trans"]["tomeg"]; ?>">
        <input type="text" name="package_unit" placeholder="<?php echo $_SESSION["trans"]["csomagolasi_egyseg"]; ?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["webes"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_web"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["web_akcio"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_web_action"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["arat_frissiteni"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_refresh_price_need"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <input type="number" name="max_stock_qty" placeholder="<?php echo $_SESSION["trans"]["maximalis_keszlet"]; ?>">
        <input type="text" name="create_date" placeholder="<?php echo $_SESSION["trans"]["letrehozas_datuma"]; ?>">
        <input type="text" name="code_bar" placeholder="<?php echo $_SESSION["trans"]["vonalkod"]; ?>">
        <input type="text" name="batch_type" placeholder="<?php echo $_SESSION["trans"]["sorozatszam"]; ?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["aktiv_e"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_active"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <input type="number" name="pack_length" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_hosszusag"]; ?>">
        <input type="number" name="pack_width" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_szelesseg"]; ?>">
        <input type="number" name="pack_height" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_magassag"]; ?>">
        <input type="number" name="pack_volume" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_terfogat"]; ?>">
        <input type="number" name="pack_weight" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_suly"]; ?>">
        <input type="number" name="sales_length" placeholder="<?php echo $_SESSION["trans"]["eladasi_hosszusag"]; ?>">
        <input type="number" name="sales_width" placeholder="<?php echo $_SESSION["trans"]["eladasi_szelesseg"]; ?>">
        <input type="number" name="sales_height" placeholder="<?php echo $_SESSION["trans"]["eladasi_magassag"]; ?>">
        <input type="number" name="sales_volume" placeholder="<?php echo $_SESSION["trans"]["eladasi_terfogat"]; ?>">
        <input type="number" name="sales_weight" placeholder="<?php echo $_SESSION["trans"]["eladasi_suly"]; ?>">
        <input type="number" name="sales_unit_id" data-name="sales_unit_id" class="cfl" data-cfl_class="Package" placeholder="<?php echo $_SESSION["trans"]["eladasi_egyseg_azonositoja"]; ?>">
        <input type="number" name="sales_unit_amount" placeholder="<?php echo $_SESSION["trans"]["eladasi_egyseg_mennyisege"]; ?>">
        <input type="number" name="sales_packing_id" data-name="sales_packing_id" class="cfl" data-cfl_class="Package" placeholder="<?php echo $_SESSION["trans"]["eladasi_csomagolas_azonosito"]; ?>">
        <input type="number" name="sales_packing_amount" placeholder="<?php echo $_SESSION["trans"]["eladasi_csomagolas_mennyisege"]; ?>">
        <table>
            <tr>
                <td><?php echo $_SESSION["trans"]["raktarankenti_min_max_kezeles"]; ?></td>
                <td>
                <span class="switch">
                    <input type="checkbox" value="1" name="is_stock_quantityhandling"><label></label>
                </span>
                </td>
            </tr>
        </table>
        <input type="number" name="min_order_quantity" placeholder="<?php echo $_SESSION["trans"]["minimalis_rendelesi_mennyiseg"]; ?>">
        <input type="number" name="order_lead_day" placeholder="<?php echo $_SESSION["trans"]["rendeles_atfutasi_ido"]; ?>">
        <input type="number" name="order_tolerance_day" placeholder="<?php echo $_SESSION["trans"]["rendeles_turesi_ido"]; ?>">
        <input type="text" name="production_method" placeholder="<?php echo $_SESSION["trans"]["beszerzesi_metodus"]; ?>">
        <input type="text" name="production_realese_method" placeholder="<?php echo $_SESSION["trans"]["gyartas_soran_alkatreszek_keszletkiadasi_modszere"]; ?>">
        <input type="number" name="web_seq" placeholder="<?php echo $_SESSION["trans"]["web_lista_sorszam"]; ?>">
        <button type="submit" name="add"><?php echo $_SESSION["trans"]["regisztracio"]; ?></button>
    </form>
</div>