<base href="<?php echo ROOT_CRM;?>">
<link href="css/reset.css"  type="text/css" rel="stylesheet">
<link href="css/onepcssgrid.css"  type="text/css" rel="stylesheet">
<link href="css/animate.css"  type="text/css" rel="stylesheet">

<link href="css/fancybox/jquery.fancybox.css"  type="text/css" rel="stylesheet">

<link href="css/site.css"  type="text/css" rel="stylesheet">
<link href="css/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="css/bootstrap-select.css"  type="text/css" rel="stylesheet">
<link href="js/bootstrap-slider-master/css/bootstrap-slider.css"  type="text/css" rel="stylesheet">
<link href="css/jquery-ui.min.css"  type="text/css" rel="stylesheet">

<link href="css/pushy.css" rel="stylesheet" type="text/css">



<script type="text/javascript" >

// JavaScript Document PREJQUERY
(function (w, d, u) {

    // Define two queues for handlers
    w.readyQ = [];
    w.bindReadyQ = [];

    // Push a handler into the correct queue
    function pushToQ(x, y) {
        if (x == "ready") {
            w.bindReadyQ.push(y);
        } else {
            w.readyQ.push(x);
        }
    }

    // Define an alias object (for use later)
    var alias = {
        ready: pushToQ,
        bind: pushToQ
    }

    // Define the fake jQuery function to capture handlers
    w.$ = w.jQuery = function (handler) {
        if (handler === d || handler === u) {
            // Queue $(document).ready(handler), $().ready(handler)
            // and $(document).bind("ready", handler) by returning
            // an object with alias methods for pushToQ
            return alias;
        } else {
            // Queue $(handler)
            pushToQ(handler);
        }
    }

})(window, document);
</script>

