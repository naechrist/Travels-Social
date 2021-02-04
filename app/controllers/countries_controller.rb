class CountriesController < ApplicationController
    before_action :set_country, only: [:show, :destroy]
    before_action :log_in_to_edit, only: [:new, :create, :destroy]

    def new
        @country = Country.new 
    end

    def create
        @country = Country.new(country_params)
        if @country.save #valadations happen here
            redirect_to country_path(@country)
        else 
            render :new
        end 
    end 

    def show 
    end 

    def index 
        @countries = Country.alpha 
    end 

    def destroy 
        @country.destroy
        redirect_to countries_path
    end 

    private

    def country_params
        params.require(:country).permit(:name)
    end 

    def set_country
        @country = Country.find_by_id(params[:id])
    end 

    def log_in_to_edit 
        if !logged_in?
            redirect_to login_path
        end
    end 
end
