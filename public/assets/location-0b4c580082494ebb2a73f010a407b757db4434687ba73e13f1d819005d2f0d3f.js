

$(document).ready(function() {
	$(".search-form").on("submit", function (e) {
		e.preventDefault();
		var city = $("#location_city").val();
		var state = $("#location_state").val();
		
		//ajax request to the wunderground api with the state and city values from the form passed into the url

		$.ajax({
			url : "http://api.wunderground.com/api/9f9665f04fbd9ca7/geolookup/conditions/q/"+state+"/"+city+".json",
			dataType : "jsonp",
			success : function(parsed_json) {
				var location = parsed_json['location']['city'];
				var temperature_string = parsed_json['current_observation']['temperature_string'];
				var weather = parsed_json['current_observation']['weather'];
				var icon_url = parsed_json['current_observation']['icon_url'];
				var relative_humidity = parsed_json['current_observation']['relative_humidity'];
				var feelslike_string = parsed_json['current_observation']['feelslike_string'];
				var wind_dir = parsed_json['current_observation']['wind_dir'];
				var wind_string = parsed_json['current_observation']['wind_string'];
				var precip_1hr_string = parsed_json['current_observation']['precip_1hr_string'];
				var visibility_mi = parsed_json['current_observation']['visibility_mi'];
				var pressure_in = parsed_json['current_observation']['pressure_in'];
				var UV = parsed_json['current_observation']['UV'];
				
				// send post request using the forms' parameters, append info to HTML

				$.ajax({
					url: $("search-form").attr('action'),
					type: "POST",
					data: $(".search-form").serialize(),
					success : function(data) {
						$(".api-result").empty(".api-result");
						$("<div class='weather-result'>" ).html("It is " + temperature_string +  " in " + location + " and Feels Like " + feelslike_string ).prependTo( ".api-result" );
						$("<div class='weather-icon')>").html("<img src =" + icon_url +">").appendTo(".weather-result");
						$("<h2>").html(weather + ". The Relative Humidity is: " + relative_humidity + ". Wind Direction: " + wind_dir + ". Wind: " + wind_string + ". Precipitation: " + precip_1hr_string + ". Visibility: " + visibility_mi + ". Pressure: " + pressure_in + ". UV: " + UV ).appendTo(".api-result");
						$(".api-result").removeClass("hide");
						$(".api-result").append($(data));
						$('input[type="text"],textarea').val('');
							
				//prevent default action on submit comment form, read values, send ajax post request with form data, append data to HTML

						$(".submit-comment").on("submit", function (e) {
							e.preventDefault();
							var name = $("#comment_name").val();
							var comment = $("#comment_comment").val();
							$.ajax({
								url: $(".submit-comment").attr('action'),
								type: "POST",
								data: $(".submit-comment").serialize(),
								success : function(data) {
									$(".comment-list").append($(data));
									$('input[type="text"],textarea').val('');
								}
							});
						});
					}
				});
}
});
});
}); 



                          
                          
                          
                          
                          
                          
                          
                          
                           
                          
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           

$(document).ready(function() {
	$(".search-form").on("submit", function (e) {
		e.preventDefault();
		var city = $("#location_city").val();
		var state = $("#location_state").val();
		
		//ajax request to the wunderground api with the state and city values from the form passed into the url

		$.ajax({
			url : "http://api.wunderground.com/api/9f9665f04fbd9ca7/geolookup/conditions/q/"+state+"/"+city+".json",
			dataType : "jsonp",
			success : function(parsed_json) {
				var location = parsed_json['location']['city'];
				var temperature_string = parsed_json['current_observation']['temperature_string'];
				var weather = parsed_json['current_observation']['weather'];
				var icon_url = parsed_json['current_observation']['icon_url'];
				var relative_humidity = parsed_json['current_observation']['relative_humidity'];
				var feelslike_string = parsed_json['current_observation']['feelslike_string'];
				var wind_dir = parsed_json['current_observation']['wind_dir'];
				var wind_string = parsed_json['current_observation']['wind_string'];
				var precip_1hr_string = parsed_json['current_observation']['precip_1hr_string'];
				var visibility_mi = parsed_json['current_observation']['visibility_mi'];
				var pressure_in = parsed_json['current_observation']['pressure_in'];
				var UV = parsed_json['current_observation']['UV'];
				
				// send post request using the forms' parameters, append info to HTML

				$.ajax({
					url: $("search-form").attr('action'),
					type: "POST",
					data: $(".search-form").serialize(),
					success : function(data) {
						$(".api-result").empty(".api-result");
						$("<div class='weather-result'>" ).html("It is " + temperature_string +  " in " + location + " and Feels Like " + feelslike_string ).prependTo( ".api-result" );
						$("<div class='weather-icon')>").html("<img src =" + icon_url +">").appendTo(".weather-result");
						$("<h2>").html("Forecast is " + weather + ". The Relative Humidity is " + relative_humidity + ". Wind Direction is " + wind_dir + ". Wind is " + wind_string + ". Precipitation is " + precip_1hr_string + ". Visibility is " + visibility_mi + ". Pressure is " + pressure_in + " and UV is " + UV ).appendTo(".api-result");
						$(".api-result").removeClass("hide");
						$(".api-result").append($(data));
						$('input[type="text"],textarea').val('');
							
				//prevent default action on submit comment form, read values, send ajax post request with form data, append data to HTML

						$(".submit-comment").on("submit", function (e) {
							e.preventDefault();
							var name = $("#comment_name").val();
							var comment = $("#comment_comment").val();
							$.ajax({
								url: $(".submit-comment").attr('action'),
								type: "POST",
								data: $(".submit-comment").serialize(),
								success : function(data) {
									$(".comment-list").append($(data));
									$('input[type="text"],textarea').val('');
								}
							});
						});
					}
				});
}
});
});
}); 



                          
                          
                          
                          
                          
                          
                          
                          
                           
                          
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
