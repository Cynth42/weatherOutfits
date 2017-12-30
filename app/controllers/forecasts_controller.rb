class ForecastsController < ApplicationController
    
    def about
    end
    
    def index
        
        forecast = Forecast.all
        
        
        
        respond_to do |format|
            format.json { render :json => forecast}
            format.html { render :index }
        end
        
    end
    
    def show
        @weather_lookup = WeatherLookup.new(params[:zip])
        
    end

end
