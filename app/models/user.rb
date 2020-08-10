class User < ApplicationRecord
    has_many :reviews 
    has_many :states #has many states they have visited 
    has_many :reviewed_states, through: :reviews, source: :state 

    has_secure_password 

    validates :username, uniqueness: true, presence: true 
end
