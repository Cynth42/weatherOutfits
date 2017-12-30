class CommentsController < ApplicationController
    before_action :authenticate_user! 
    
    #generates comment based on location id
    #response will be the rendering of an html partial with local variables passed in
    
    def index
        @comments = Comment.all
        @location = Location.find params[:location_id]
    end
    
    def create
        @location = Location.find(params[:location_id])
        @comment = @location.comments.create(comment_params)
    
        respond_to do |format|
            format.html { render :partial => "comments/comment",  locals: {comment: @comment} }
        
       end
    end
    
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to root_path
        
    end

    private

    #sets the attributes that are allowed for a comment
    def comment_params
        params.require(:comment).permit(:name, :body)
    end
end







