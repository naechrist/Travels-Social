class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :state

    validates :title, presence: true 
    validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
    
    scope :order_by_rating, -> {left_joins(:state).group(:id).order('avg(stars) desc')} #scope method, just changing the collection of methods
    
    def self.search(search)
        where("place LIKE ? OR content LIKE ? OR description LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
      end
end
