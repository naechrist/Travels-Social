class Country < ApplicationRecord
    has_many :states

    validates :name, uniqueness: true, presence: true

    def self.alpha #scope method 
        order(name: :asc)
    end 
end
