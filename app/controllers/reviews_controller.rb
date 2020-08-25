class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :log_in_to_edit, only: [:new, :create, :edit, :update, :destroy]
    
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
            @reviews = Review.all.order_by_rating
        end
    end 

    def create 
        @review = current_user.reviews.build(review_params) #use .build b/c it returnes a new object w its own new forign key 
        if @review.save 
            redirect_to review_path(@review)
        else 
            render :new 
        end 
    end

    def show 
    end 

    def edit 
    end 


    def update 
        @review.update(review_params)
        redirect_to review_path(@review)
    end 

    def destroy 
        @review.destroy 
        redirect_to reviews_path
    end 

    private 

    def review_params
        params.require(:review).permit(:state_id, :stars, :title, :content)
    end 

    def set_review
        @review = Review.find_by_id(params[:id])
    end 

    def log_in_to_edit
        if !logged_in?
            redirect_to login_path
        end 
    end 
end
