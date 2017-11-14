// call this from the developer console and you can control both instances
var calendars = {};
function errorDisplay(error){
	$.fancybox.open([error],{minHeight:0});
}



function messageDisplayFadeOut(message, className, timeOut){
	var messageBox = $("<div class='" + className + "-wrapper'>"
					+ "<div class='close'>"
					+ "<svg style='position: absolute; width: 100%; height: 100%; left: 0px;' xmlns='http://www.w3.org/2000/svg' width='100' height='100' viewBox='0 0 100 100'>"
					+ "<line x1='0' y1='0' x2='100' y2='100'></line>"
					+ "<line x1='0' y1='100' x2='100' y2='0'></line>"
					+ "</svg>"
					+ "</div>"
					+ "<div class='" + className + "'>" + message + "</div>"
				+"</div>");
	$("body").append(messageBox);
	setTimeout(function(){
		messageBox.fadeOut(500, function(){
			$(this).remove();
		});
	}, timeOut);
	
}

var createCookie = function(name, value, days) {
    var expires;
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    }
    else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = document.cookie.length;
            }
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return false;
}

function debounce(fn, delay) {
	var timer = null;
	return function () {
		var context = this, args = arguments;
		clearTimeout(timer);
		timer = setTimeout(function () {
			fn.apply(context, args);
		}, delay);
	};
}

$(document).ready( function() {
	
	(function ($, doc) {
		$.each(readyQ, function (index, handler) {
			$(handler);
		});
		$.each(bindReadyQ, function (index, handler) {
			$(doc).bind("ready", handler);
		});
	})(jQuery, document);
	
	
	
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(saveLocation, onGeoError);
			options = {
			  enableHighAccuracy: false,
			  timeout: 60000,
			  maximumAge: 0
			};
			 navigator.geolocation.watchPosition(saveLocation, onGeoError, options);
		} 
		
	}
	
	function onGeoError(e){
		
		x = "";
		 switch(e.code) {
			case e.PERMISSION_DENIED:
				x = "User denied the request for Geolocation.";
				break;
			case e.POSITION_UNAVAILABLE:
				x = "Location information is unavailable.";
				break;
			case e.TIMEOUT:
				x = "The request to get user location timed out.";
				break;
			case e.UNKNOWN_ERROR:
				x = "An unknown error occurred.";
				break;
		}
	
		
	}
	
	function saveLocation(position) {
		console.log(position);
		
		$.post("ajax/ajax.php", {"class": "Location", "action": "method", "method": "SetLocationAjax", "data": [{position}]}, function(data){
			
		}, "json");
	}
	
	getLocation();
	
	$(".datetime").datetimepicker();
	
	$(".fancybox").fancybox();
	
	
	 $('.flexslider').flexslider({
		animation: "slide",
		animationLoop: false,
		itemWidth: 150,
		itemMargin: 5
	  });
	$(".slider").bootstrapSlider({
		tooltip:"hide"
			
	});
		
	
	$(window).on("scroll", debounce(function(e){
		height = $("#video-container").outerHeight() ;
		if($(window).scrollTop() > height){
			if(!$("#top").hasClass("fixed")){
				$("#wrapper > div").css({"margin-top": height * 2 - (height / 4) + 'px'});
				$("#top").addClass("fixed");
				
				if($("#video-container").length > 0){
					$("#video-container").addClass("fixed");
				}
			}
			
		} else {
			$("#top").removeClass("fixed");
			$("#wrapper > div").css({"margin-top": '66px'})
			if($("#video-container").length > 0){
				$("#video-container").removeClass("fixed");
			}
		}
	}, 100));;
	
	$(document).on("click", "#menu-button", function(){
		if($("nav").hasClass("open") || $("nav").hasClass("close")){
			$("nav").toggleClass("close");
		}
		$("body").toggleClass("overflow");
		$("nav").toggleClass("open");
		
	});
	
	$(document).on("click", "nav .nav-element", function(e){
		
		var list = $(this).closest("li").find(".nav-list").first();
		console.log(list);
		if(list.length > 0){
			e.preventDefault();
			if(list.hasClass("open")){
				list.removeClass("open");
				
			} else {
				
				$(".nav-list.open").removeClass("open");
				//list.show();
				list.addClass("open");
			}
		} 
	});
	
	
	$(document).on("click", ".info-wrapper .close, .error-wrapper .close", function(){
		$(this).parent().remove();
	});
	
	//ERROR DISPLAYER
	
	$.datepicker.setDefaults({
        dateFormat : "yy-mm-dd",
        closeText: 'bezár',
        prevText: 'vissza',
        nextText: 'előre',
        currentText: 'ma',
        monthNames: ['Január', 'Február', 'Március', 'Április', 'Május', 'Június','Július', 'Augusztus', 'Szeptember', 'Október', 'November', 'December'],
        monthNamesShort: ['Jan', 'Feb', 'Már', 'Ápr', 'Máj', 'Jún',	'Júl', 'Aug', 'Szep', 'Okt', 'Nov', 'Dec'],
        dayNames: ['Vasárnap', 'Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat'],
        dayNamesShort: ['Vas', 'Hét', 'Ked', 'Sze', 'Csü', 'Pén', 'Szo'],
        dayNamesMin: ['V', 'H', 'K', 'Sze', 'Cs', 'P', 'Szo'],
        weekHeader: 'Hét',
    });
    
	$.timepicker.setDefaults({timeFormat: "HH:mm:ss"});

  // assuming you've got the appropriate language files,
  // clndr will respect whatever moment's language is set to.
  // moment.lang('ru');

  // here's some magic to make sure the dates are happening this month.

  // var thisMonth = moment().format('YYYY-MM');

  // var eventArray = [
    // { startDate: thisMonth + '-10', endDate: thisMonth + '-14', title: 'Multi-Day Event' },
    // { startDate: thisMonth + '-21', endDate: thisMonth + '-23', title: 'Another Multi-Day Event' }
  // ];

  // the order of the click handlers is predictable.
  // direct click action callbacks come first: click, nextMonth, previousMonth, nextYear, previousYear, or today.
  // then onMonthChange (if the month changed).
  // finally onYearChange (if the year changed).
	/*
  calendars.clndr1 = $('.cal1').clndr({
    events: eventArray,
    // constraints: {
    //   startDate: '2013-11-01',
    //   endDate: '2013-11-15'
    // },
    clickEvents: {
      click: function(target) {
        console.log(target);
        if($(target.element).hasClass('inactive')) {
          console.log('not a valid datepicker date.');
        } else {
          console.log('VALID datepicker date.');
        }
      },
      nextMonth: function() {
        console.log('next month.');
      },
      previousMonth: function() {
        console.log('previous month.');
      },
      onMonthChange: function() {
        console.log('month changed.');
      },
      nextYear: function() {
        console.log('next year.');
      },
      previousYear: function() {
        console.log('previous year.');
      },
      onYearChange: function() {
        console.log('year changed.');
      }
    },
    multiDayEvents: {
      startDate: 'startDate',
      endDate: 'endDate'
    },
    showAdjacentMonths: true,
    adjacentDaysChangeMonth: false
  });

  // calendars.clndr2 = $('.cal2').clndr({
  //   template: $('#template-calendar').html(),
  //   events: eventArray,
  //   startWithMonth: moment().add('month', 1),
  //   clickEvents: {
  //     click: function(target) {
  //       console.log(target);
  //     }
  //   }
  // });

  // bind both clndrs to the left and right arrow keys
  $(document).keydown( function(e) {
    if(e.keyCode == 37) {
      // left arrow
      calendars.clndr1.back();
      calendars.clndr2.back();
    }
    if(e.keyCode == 39) {
      // right arrow
      calendars.clndr1.forward();
      calendars.clndr2.forward();
    }
  });
  */

  $("input[type=datetime]").datetimepicker();
  

});