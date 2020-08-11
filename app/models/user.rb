class User < ApplicationRecord
    has_many :reviews 
    has_many :states #has many states they have visited 
    has_many :reviewed_states, through: :reviews, source: :state 

    has_secure_password 

    validates :username, uniqueness: true, presence: true 

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end 
    end 


end
