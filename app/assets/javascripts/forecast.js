$(function(){
	console.log("page loaded")

function load(){
	signed_in_get_weather();

};
load();

function signed_in_get_weather(){
var search_button = $('#search')
	search_button.on("click", function(event) {
	event.preventDefault();
		console.log("search button click");
	
	$.ajax({
		type:"GET",
		url:"http://localhost:3000/weather?zip=" + $('#zipcode').val()
		}).done(function(data){

			var weather_data = data;
				console.log(data);

			var ul_weather = $('#weather');

			ul_weather.empty();	
			ul_weather.append(weather_data)
		})
	})
