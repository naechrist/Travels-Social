class StatesController < ApplicationController
    before_action :set_state, only: [:show, :destroy]

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
    end 

    def index 
        @states = State.alpha
    end 

    def destroy 
        @state.destroy 
        redirect_to states_path
    end 

    private 

    def state_params 
        params.require(:state).permit(:place, :description, :country_id, country_attributes: [:name])
    end 

    def set_state
        @state = State.find_by_id(params[:id])
    end 

end
