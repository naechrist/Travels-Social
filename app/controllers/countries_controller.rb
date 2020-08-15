class CountriesController < ApplicationController

    def index 
        @countries = Country.alpha 
    end 
end
