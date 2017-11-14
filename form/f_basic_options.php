<?php
echo MyException::messageDisplay();
?>
<!--jquery tabs a cikkhez tartozó segédtáblákhoz-->
<div id="tabs">
    <ul>
        <li>
            <a href="basic_options/#tabs-1"><?php echo $_SESSION["trans"]["mennyisegi_egyseg"]; ?></a>
        </li>
        <li>
            <a href="basic_options/#tabs-2"><?php echo $_SESSION["trans"]["valuta"]; ?></a>
        </li>
        <li>
            <a href="basic_options/#tabs-3"><?php echo $_SESSION["trans"]["csomagolas"]; ?></a>
        </li>
        <li>
            <a href="basic_options/#tabs-4"><?php echo $_SESSION["trans"]["sorozat"]; ?></a>
        </li>
        <li>
            <a href="basic_options/#tabs-5"><?php echo $_SESSION["trans"]["vamtarifaszam"]; ?></a>
        </li>
    </ul>
    <div id="tabs-1">
        <?php require_once("item/item_amount.php"); ?>
    </div>
    <div id="tabs-2">
        <?php require_once("item/item_currency.php");?>
    </div>
    <div id="tabs-3">
        <?php require_once("item/item_package.php"); ?>
    </div>
    <div id="tabs-4">
        <?php require_once("item/item_series_type.php"); ?>
    </div>
    <div id="tabs-5">
        <?php require_once("item/item_vtsz.php"); ?>
    </div>
</div>
