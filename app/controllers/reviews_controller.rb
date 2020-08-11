class ReviewsController < ApplicationController

    def new 
        if @state = State.find_by(params[:state_id])
            @review = @state.reviews.build
        else 
            @review = Review.new 
        end 

    end 

    def index 
        
            @reviews = Review.all
            if params[:search]
              @reviews = Review.search(params[:search]).order("created_at DESC")
            else
              @reviews = Review.all.order("created_at DESC")
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

    def edit 
        @review = Review.find_by_id(params[:id])
    end 

    def update 
        @review = Review.find_by_id(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end 

    def destroy 
        @review = Review.find_by_id(params[:id])
        @review.destroy 
        redirect_to reviews_path
    end 

    private 

    def review_params
        params.require(:review).permit(:state_id, :stars, :title, :content)
    end 
end
