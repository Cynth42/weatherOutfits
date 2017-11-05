class ForecastsController < ApplicationController
    def index
        
        forecast = Forecast.all
        
        
        
        respond_to do |format|
            format.json { render :json => forecast}
            format.html { render :index }
        end
        
    end
    
    def show
        @weather_lookup = Weather_lookup.new(params[:city], params[:state])
        
    end

end
