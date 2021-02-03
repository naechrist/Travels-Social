class Location < ApplicationRecord
    belongs_to :state
    belongs_to :user, optional: true #creator of it
    has_many :reviews
    has_many :users, through: :reviews 

    validates :place, presense: true
end
