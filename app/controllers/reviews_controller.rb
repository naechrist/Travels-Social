class ReviewsController < ApplicationController

    def new 
        if @state = State.find_by(params[:state_id])
            @review = @state.reviews.build
        else 
            @review = Review.new 
        end 

    end 

    def index 
        #check if its nested or not
        if @state = State.find_by_id(params[:state_id]) #nested
            @reviews = @state.reviews #all of this states reviews
        else 
            @reviews = Review.all 
        end 
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to review_path(@review)
        else 
            render :new 
        end 
    end

    def show 
        @review = Review.find_by_id(params[:id])
    end 

    private 

    def review_params
        params.require(:review).permit(:state_id, :stars, :title, :content)
    end 
end
