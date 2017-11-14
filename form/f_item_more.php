<?php

$className = "Item";
$obj = new $className(array("id" => $_GET["id"]));
$_SESSION["id"] = $_GET["id"];
$_SESSION["item_modify"] = true;

/*$_SESSION["amount_id"] = $obj->amount_id;
$_SESSION["currency_id"] = $obj->currency_id;
$_SESSION["package_id"] = $obj->sales_unit_id;
$_SESSION["series_type_id"] = $obj->series_type_id;
$_SESSION["vtsz"] = $obj->vtsz;*/

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
    });
</script>
<!--a cikk tulajdonságainak listája-->
<div class="onerow">
    <div class="col6">
        <table>
            <tbody>
            <tr>
                <td>ID</td>
                <td><label><?php echo $obj->id; ?></label></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["cikkszam"];?></td>
                <td><input type="text" class="databaseChange" name="code" value="<?php echo $obj->code; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["nev"];?></td>
                <td><input type="text" class="databaseChange" name="name" value="<?php echo $obj->name; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["szam"];?></td>
                <td><input type="text" class="cfl" name="vtsz" data-cfl_class="Vtsz" data-name="vtsz" value="<?php echo $obj->vtsz; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["mennyisegi_egyseg_azonosito"];?></td>
                <td><input type="number" class="cfl" name="amount_id" data-name="amount_id" data-cfl_class="Amount" value="<?php echo $obj->amount_id; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["minimum_mennyiseg_figyeles_raktaron"];?></td>
                <td><input type="number" class="databaseChange" name="min_stock_qty" value="<?php echo $obj->min_stock_qty; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col6 last">
        <table>
            <tbody>
            <tr>
                <td><?php echo $_SESSION["trans"]["aktualis_beszerzesi_ar"];?></td>
                <td><input type="number" class="databaseChange" name="in_price" value="<?php echo $obj->in_price; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["deviza"];?></td>
                <td><input type="number" class="cfl" name="currency_id" data-name="currency_id" data-cfl_class="Currency" value="<?php echo $obj->currency_id; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["megjegyzes"];?></td>
                <td><input type="text" class="databaseChange" name="comment" value="<?php echo $obj->comment; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["eladasi_mennyisegi_egyseg"];?></td>
                <td><input type="number" class="cfl" name="sold_amount" data-name="sold_amount" data-cfl_class="Amount" value="<?php echo $obj->sold_amount; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["mennyisegi_valtoszam"];?></td>
                <td><input type="number" class="databaseChange" name="amount_exchange_number" value="<?php echo $obj->amount_exchange_number; ?>"
                           data-id="<?php echo $obj->id; ?>"/></td>
            </tr>
            <tr>
                <td><?php echo $_SESSION["trans"]["keszletezheto"];?></td>
                <td><span class="switch">
                                <input type="checkbox" <?php echo $obj->is_stock==1?"checked='checked'":"";?> class="databaseChange" name="is_stock"
                                       value="<?php echo $obj->is_stock; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
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
                        <td><?php echo $_SESSION["trans"]["beszerezheto"];?></td>
                        <td><span class="switch">
                                <input type="checkbox" <?php echo $obj->is_buyable==1?"checked='checked'":"";?> class="databaseChange" name="is_buyable"
                                       value="<?php echo $obj->is_buyable; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladhato"];?></td>
                        <td><span class="switch">
                                <input type="checkbox" <?php echo $obj->is_soldable==1?"checked='checked'":"";?> class="databaseChange" name="is_soldable"
                                       value="<?php echo $obj->is_soldable; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["penztargep_nev"];?></td>
                        <td><input type="text" class="databaseChange" name="cash_register_name" value="<?php echo $obj->cash_register_name; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["arlistas_ar"];?></td>
                        <td><input type="text" class="databaseChange" name="out_price" value="<?php echo $obj->out_price; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["sorszamkezeles"];?></td>
                        <td><span class="switch">
                                <input type="checkbox" <?php echo $obj->is_seriesable==1?"checked='checked'":"";?> class="databaseChange" name="is_seriesable"
                                       value="<?php echo $obj->is_seriesable; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                <label></label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["sorszam_kezeles_tipus_azonosito"];?></td>
                        <td><input type="number" class="cfl" data-cfl_class="Series_type" data-name="series_type_id" name="series_type_id" value="<?php echo $obj->series_type_id; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col6 last">
            <table>
                <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["torolt"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->deleted==1?"checked='checked'":"";?> class="databaseChange" name="deleted"
                                           value="<?php echo $obj->deleted; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                    <label></label>
                                </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["torles_datuma"]; ?></td>
                        <td><input type="text" class="databaseChange" name="delete_time" value="<?php echo $obj->delete_time; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["torlo_dolgozo"]." ".$_SESSION["trans"]["azonosito"]; ?></td>
                        <td><input type="number" class="databaseChange" name="delete_user_id" value="<?php echo $obj->delete_user_id; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["modositas_datuma"]; ?></td>
                        <td><input type="text" class="databaseChange" name="update_time" value="<?php echo $obj->update_time; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["modosito_dolgozo_azonosito"]; ?></td>
                        <td><input type="number" class="databaseChange" name="update_user_id" value="<?php echo $obj->update_user_id; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["kiszerelesi_egyseg"]; ?></td>
                        <td><input type="number" class="databaseChange" name="container_unit" value="<?php echo $obj->container_unit; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
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
                        <td><?php echo $_SESSION["trans"]["nyomtatvanytipus"]; ?></td>
                        <td><input type="text" class="databaseChange" name="print_type" value="<?php echo $obj->print_type; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["tomeg"]; ?></td>
                        <td><input type="number" class="databaseChange" name="weight" value="<?php echo $obj->weight; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["csomagolasi_egyseg"]; ?></td>
                        <td><input type="text" class="databaseChange" name="package_unit" value="<?php echo $obj->package_unit; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["webes"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->is_web==1?"checked='checked'":"";?> class="databaseChange" name="is_web"
                                           value="<?php echo $obj->is_web; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                    <label></label>
                                </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["web_akcio"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->is_web_action==1?"checked='checked'":"";?> class="databaseChange" name="is_web_action"
                                           value="<?php echo $obj->is_web_action; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                    <label></label>
                                </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["arat_frissiteni"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->is_refresh_price_need==1?"checked='checked'":"";?> class="databaseChange" name="is_refresh_price_need"
                                           value="<?php echo $obj->is_refresh_price_need; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
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
                        <td><?php echo $_SESSION["trans"]["maximalis_keszlet"];?></td>
                        <td><input type="number" class="databaseChange" name="max_stock_qty" value="<?php echo $obj->max_stock_qty; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["letrehozas_datuma"];?></td>
                        <td><input type="text" class="databaseChange" name="create_date" value="<?php echo $obj->create_date; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["vonalkod"];?></td>
                        <td><input type="text" class="databaseChange" name="code_bar" value="<?php echo $obj->code_bar; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["sorozatszam"];?></td>
                        <td><input type="text" class="databaseChange" name="batch_type" value="<?php echo $obj->batch_type; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["aktiv_e"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->is_active==1?"checked='checked'":"";?> class="databaseChange" name="is_active"
                                           value="<?php echo $obj->is_active; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                    <label></label>
                                </span>
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
                        <td><?php echo $_SESSION["trans"]["beszerzesi_hosszusag"];?></td>
                        <td><input type="number" class="databaseChange" name="pack_length" value="<?php echo $obj->pack_length; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["beszerzesi_szelesseg"];?></td>
                        <td><input type="number" class="databaseChange" name="pack_width" value="<?php echo $obj->pack_width; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["beszerzesi_magassag"];?></td>
                        <td><input type="number" class="databaseChange" name="pack_height" value="<?php echo $obj->pack_height; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["beszerzesi_terfogat"];?></td>
                        <td><input type="number" class="databaseChange" name="pack_volume" value="<?php echo $obj->pack_volume; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["beszerzesi_suly"];?></td>
                        <td><input type="number" class="databaseChange" name="pack_weight" value="<?php echo $obj->pack_weight; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col6 last">
            <table>
                <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_hosszusag"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_length" value="<?php echo $obj->sales_length; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_szelesseg"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_width" value="<?php echo $obj->sales_width; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_magassag"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_height" value="<?php echo $obj->sales_height; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_terfogat"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_volume" value="<?php echo $obj->sales_volume; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_suly"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_weight" value="<?php echo $obj->sales_weight; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
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
                        <td><?php echo $_SESSION["trans"]["eladasi_egyseg_azonositoja"];?></td>
                        <td><input type="number" class="cfl" data-cfl_class="Package" data-name="sales_unit_id" name="sales_unit_id" value="<?php echo $obj->sales_unit_id; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_egyseg_mennyisege"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_unit_amount" value="<?php echo $obj->sales_unit_amount; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_csomagolas_azonosito"];?></td>
                        <td><input type="number" class="cfl" data-cfl_class="Package" data-name="sales_packing_id" name="sales_packing_id" value="<?php echo $obj->sales_packing_id; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["eladasi_csomagolas_mennyisege"];?></td>
                        <td><input type="number" class="databaseChange" name="sales_packing_amount" value="<?php echo $obj->sales_packing_amount; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["raktarankenti_min_max_kezeles"];?></td>
                        <td><span class="switch">
                                    <input type="checkbox" <?php echo $obj->is_stock_quantityhandling==1?"checked='checked'":"";?> class="databaseChange" name="is_stock_quantityhandling"
                                           value="<?php echo $obj->is_stock_quantityhandling; ?>" data-id="<?php echo $_GET["id"]; ?>"/>
                                    <label></label>
                                </span>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["minimalis_rendelesi_mennyiseg"];?></td>
                        <td><input type="number" class="databaseChange" name="min_order_quantity" value="<?php echo $obj->min_order_quantity; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col6 last">
            <table>
                <tbody>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["rendeles_atfutasi_ido"];?></td>
                        <td><input type="number" class="databaseChange" name="order_lead_day" value="<?php echo $obj->order_lead_day; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["rendeles_turesi_ido"];?></td>
                        <td><input type="number" class="databaseChange" name="order_tolerance_day" value="<?php echo $obj->order_tolerance_day; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["beszerzesi_metodus"];?></td>
                        <td><input type="text" class="databaseChange" name="production_method" value="<?php echo $obj->production_method; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["gyartas_soran_alkatreszek_keszletkiadasi_modszere"];?></td>
                        <td><input type="text" class="databaseChange" name="production_realese_method" value="<?php echo $obj->production_realese_method; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                    <tr>
                        <td><?php echo $_SESSION["trans"]["web_lista_sorszam"];?></td>
                        <td><input type="number" class="databaseChange" name="web_seq" value="<?php echo $obj->web_seq; ?>"
                                   data-id="<?php echo $obj->id; ?>"/></td>
                    </tr>
                </tbody>
            </table>
            <div class="onerow">
                <div class="col3">
                    <button id="modify_i"><?php echo $_SESSION["trans"]["modosit"]; ?></button>
                </div>
            </div>
        </div>
    </div>
