class StatesController < ApplicationController

    def new 
        @state = State.new
    end 

    def create
        @state = State.new(state_params)
        @state.user_id = session[:user_id]
        if @state.save #validations happen here
            redirect_to state_path(@state)
        else 
            render :new 
        end 
    end 

    def show 
        @state = State.find(params[:id])
    end 

    def index 
        @states = State.order_by_rating 
    end 

    private 

    def state_params 
        params.require(:state).permit(:place, :description, :country_id, country_attributes: [:name])
    end 

end
