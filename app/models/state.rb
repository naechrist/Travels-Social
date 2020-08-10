class State < ApplicationRecord
    belongs_to :country
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :reviews 
    accepts_nested_attributes_for :country
    validates :place, presence: true

    def state_attributes=(attributes)
        state = State.find_or_create_by(attributes) if !attributes['place'].empty?
    end 
end
