class Book < ApplicationRecord


	validates :title, uniqueness: true
	validates :author, presence: true
	validates :genre, presence: true
	validates :description, presence: :true
	validates :length_in_pages, presence: true

	has_many :meetings
	has_many :meeting_users, through: :meetings
	has_many :users, through: :meeting_users
	has_many :groups, through: :meetings 
	has_many :wishlist_books
	has_many :wishlists, through: :wishlist_books
	# accepts_nested_attributes_for :meetings
	
	# has many wish_lists
end
