<div>
<!-- Pushy Menu -->
<nav class="pushy pushy-left" data-focus="#first-link">
    <div class="pushy-content">
        <ul>
            <!-- Submenu -->
            <li class="pushy-submenu">
                <button id="first-link"><?php echo $_SESSION["trans"]["torzsadatok"]; ?></button>
                <ul>
                    <li class="pushy-link"><a href="employers/"><?php echo $_SESSION["trans"]["felhasznalok"]; ?></a></li>
                    <li class="pushy-link"><a href="partners_list/"><?php echo $_SESSION["trans"]["partnerek"]; ?></a></li>
                </ul>
            </li>
            <li class="pushy-submenu">
                <button id="first-link"><?php echo $_SESSION["trans"]["keszlet"];?></button>
                <ul>
                    <li class="pushy-link"><a href="items_list/"><?php echo $_SESSION["trans"]["cikktorzsadat"];?></a></li>
                </ul>
            </li>
            <li class="pushy-submenu">
                <button id="first-link"><?php echo $_SESSION["trans"]["beallitasok"];?></button>
                <ul>
                    <li class="pushy-link"><a href="basic_options/"><?php echo $_SESSION["trans"]["altalanos"];?></a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<!-- Site Overlay -->
<div class="site-overlay"></div>

<!-- Your Content -->
<div id="container">
    <!-- Menu Button -->
    <div class="onerow">
    <div class="col1">
        <button class="menu-btn" >&#9776; </button>
    </div >
    </div>