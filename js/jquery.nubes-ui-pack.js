(function(global, factory) {
    'use strict';
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], function($) {
          return factory($, global, global.document);
        });
    } else if (typeof exports !== 'undefined') {
        module.exports = factory(require('jquery'), global, global.document);
    } else {
        factory(jQuery, global, global.document);
    }
})(typeof window !== 'undefined' ? window : this, function($, window, document, undefined) {


	$(function() {

        $("input.cfl").each(function (index, element) {
            var cfl = $("<label class='cfl' id=" + index + "></label>");
            var cfl_class = $(this).data("cfl_class");
            var id = $(this).data("id");
            var name = $(this).data("name");

            $("<div class='cfl'></div>").insertBefore(element).append(element).append(cfl);

            $(document).on("click", "label.cfl", function (event) {

                if(event.currentTarget.id == index) {

                    $.post("ajax/ajax.php", {
                        "class": "Cfl",
                        "action": "method",
                        "method": "getDataTable",
                        "data": {"class": cfl_class, "name": name, "id" : index},
                        "identifier": id
                    }, function (data) {

                        var success = data.success || false;

                        if (!success) {
                            $.fancybox.open([data.error]);
                            return;
                        }
                        $.fancybox.open([data.data]);


                    $('input[type=radio]').on('change', function () {
                        $('input[type=radio]').not(this).prop('checked', false);
                    });

                        $(function () {

                            var column = $(this).prop("name");

                            $(document).on("click", "button#ok", function () {

                                var value = $("input.ok").data("value");
                                var data = {
                                    "data": {}
                                };
                                data["data"][column] = value;

                                console.log(data, value);

                                $(element).val(value);
                            });
                        });
                    }, "json");
                }
            });
        });
    });
});