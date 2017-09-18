class WishlistBook < ActiveRecord::Base

	belongs_to :book 
	belongs_to :wishlist 
	has_many :votes, dependent: :destroy


end