class Location < ApplicationRecord
    belongs_to :state
    belongs_to :user, optional: true #creator of it
    has_many :reviews
    has_many :users, through: :reviews 

    validates :place, presence: true

    def state_attributes=(attributes)
        state = State.find_or_create_by(attributes) if !attributes['place'].empty?
    end 

    def place_and_country #model methods are instance methods 
        "#{place} - #{state.name}"
    end     

    def self.search(search)
        where("place LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
      end
end
