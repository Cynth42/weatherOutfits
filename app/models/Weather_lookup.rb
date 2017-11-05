class Weather_lookup
    
    attr_accessor :temperature, :city, :state, :icon, :weekday_name, :chance_of_rain, :chance_of_snow, :uvi, :tomorrow, :tomorrow_condition, :tomorrow_icon, :day_one, :day_one_condition, :day_one_high, :day_one_low, :day_two, :day_two_condition, :day_two_high, :day_two_low, :day_three, :day_three_condition, :day_three_high, :day_three_low, :day_four, :day_four_condition, :day_four_high, :day_four_low, :day_five, :day_five_condition, :day_five_high, :day_five_low, :day_six, :day_six_condition, :day_six_high, :day_six_low, :day_seven, :day_seven_condition, :day_seven_high, :day_seven_low
    
    def initialize(city, state)
        @city = city
        @state = state
        
        hourly_weather_hash = fetch_hourly_weather(city, state)
        hourly_temperature(hourly_weather_hash)
        
        tomorrow_weather_hash = fetch_tomorrow_weather(city, state)
        tomorrow_forecast(tomorrow_weather_hash)
        
        week_weather_hash = fetch_week_forecast(city, state)
        week_forecast(week_weather_hash)
    end
    
    def fetch_hourly_weather(city, state)
        HTTParty.get(URI.encode("http://api.wunderground.com/api/fd41ee3d477c9e9b/hourly/q/#{city}/#{state}.xml"))
    end
    
    def hourly_temperature(hourly_weather_hash)
        
        hourly_forecast_response = hourly_weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
        self.temperature = hourly_forecast_response['temp']['english']
        self.icon = hourly_forecast_response['icon_url']
        self.weekday_name = hourly_forecast_response['FCTTIME']['pretty']
        
        self.chance_of_rain = hourly_forecast_response['pop']
        self.chance_of_snow = hourly_forecast_response['snow']['english']
        self.uvi = hourly_forecast_response['uvi']
    end
    
    
    
    def fetch_tomorrow_weather(city, state)
        HTTParty.get(URI.encode("http://api.wunderground.com/api/fd41ee3d477c9e9b/forecast/q/#{city}/#{state}.xml"))
    end
    
    def tomorrow_forecast(tomorrow_weather_hash)
        tomorrow_forecast_response = tomorrow_weather_hash.parsed_response['response']['forecast']['txt_forecast']['forecastdays']
        self.tomorrow = tomorrow_forecast_response['forecastday'][2]['title']
        self.tomorrow_condition = tomorrow_forecast_response['forecastday'][2]['fcttext']
        self.tomorrow_icon = tomorrow_forecast_response['forecastday'][2]['icon_url']
    end
    
    
    def fetch_week_forecast(city, state)
        HTTParty.get(URI.encode("http://api.wunderground.com/api/fd41ee3d477c9e9b/forecast10day/q/#{city}/#{state}.xml"))
        
    end
    
    def week_forecast(week_weather_hash)
        weekly_forecast_response = week_weather_hash.parsed_response['response']['forecast']
        self.day_one = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][0]['title']
        self.day_one_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][0]['fcttext']
        
        self.day_one_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][0]['high']['fahrenheit']
        self.day_one_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][0]['low']['fahrenheit']
        
        self.day_two = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][2]['title']
        self.day_two_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][2]['fcttext']
        
        self.day_two_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][1]['high']['fahrenheit']
        self.day_two_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][1]['low']['fahrenheit']
        
        self.day_three = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][4]['title']
        self.day_three_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][4]['fcttext']
        
        self.day_three_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][2]['high']['fahrenheit']
        self.day_three_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][2]['low']['fahrenheit']
        
        self.day_four = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][6]['title']
        self.day_four_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][6]['fcttext']
        
        self.day_four_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][3]['high']['fahrenheit']
        self.day_four_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][3]['low']['fahrenheit']
        
        self.day_five= weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][8]['title']
        self.day_five_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][8]['fcttext']
        
        self.day_five_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][4]['high']['fahrenheit']
        self.day_five_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][4]['low']['fahrenheit']
        
        self.day_six = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][10]['title']
        self.day_six_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][10]['fcttext']
        
        self.day_six_high= weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][5]['high']['fahrenheit']
        self.day_six_low= weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][5]['low']['fahrenheit']
        
        self.day_seven = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][12]['title']
        self.day_seven_condition = weekly_forecast_response['txt_forecast']['forecastdays']['forecastday'][12]['fcttext']
        
        self.day_seven_high = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][6]['high']['fahrenheit']
        self.day_seven_low = weekly_forecast_response['simpleforecast']['forecastdays']['forecastday'][6]['low']['fahrenheit']
    end
    
end
