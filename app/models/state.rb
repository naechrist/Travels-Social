class State < ApplicationRecord
    belongs_to :country
    belongs_to :user #creator of it 
    has_many :reviews
    has_many :users, through: :reviews #people who have reviewd it
    #accepts_nested_attributes_for :country
    validates :place, presence: true
    validate :not_a_duplicate 

    def self.alpha #scope method 
        order(place: :asc)
    end 

    def country_attributes=(attributes)
        country = Country.find_or_create_by(attributes) if !attributes['name'].empty?
    end 

    def not_a_duplicate #error if there is already a state / place with the same country
        if State.find_by(place: place, country_id: country_id)
            errors.add(:place, 'has already been added.')
        end 
    end 

    def place_and_country 
        "#{place} - #{country.name}"
    end     
end
