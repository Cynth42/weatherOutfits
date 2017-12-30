class LocationsController < ApplicationController
    before_action :authenticate_user!
    layout 'fin', only: [:find]
    
    def index
        @locations = Location.all
    end
    def new
        @location = current_user.locations.build
    end
    
    def find
        #makes sure the search view is read
    end
    
    def submit
        
        #finds or creates a location record in the database using the location parameters
        @location = current_user.locations.find_or_create_by(location_params) #find_or_create_by(location_params)
        #if(@location.save)
        #Saved successfully; go to the  (or wherever)...
        # redirect_to @location, notice: "location created"
        #else
        #Validation failed; show the "new" form again...
        #render :action => :new
        #end
        #response can be html or js
        #html renders the comments form partial
        
        respond_to do |format|
            format.html {render :partial => "comments/form"}
        end
    end
    
    #def show
    #    @location = Location.find(params[:id])
    #    @comment = @location.comments.build
    #    respond_to do |format|
    #        format.json { render :json => location}
    #    end
    # end
    
    private
    #sets the attributes that are allowed for a comment
    def location_params
        params.require(:location).permit(:city, :state)
    end

end
