class StatesController < ApplicationController
    before_action :set_state, only: [:show, :destroy]
    before_action :log_in_to_edit, only: [:new, :create, :destroy]

    def new 
        @state = State.new
    end 

    def create
        @state = State.new(state_params)
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
        if params[:search]
            @states = State.search(params[:search]).order("created_at DESC")
        else
            @states = State.all
        end
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

    def log_in_to_edit
        if !logged_in?
            redirect_to login_path
        end 
    end

end
