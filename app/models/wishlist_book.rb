class WishlistBook < ActiveRecord::Base

	belongs_to :book 
	belongs_to :wishlist 


end