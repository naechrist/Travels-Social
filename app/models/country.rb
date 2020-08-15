class Country < ApplicationRecord
    has_many :states

    def self.alpha #scope method 
        order(name: :asc)
    end 
end
