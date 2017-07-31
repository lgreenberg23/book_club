class Group < ApplicationRecord

	validates :name, uniqueness: true
	validates :frequency, presence: true
	validates :genres_read, presence: true
	validates :size, presence: true

	has_many :users
	has_many :meetings
	has_many :members
	has_many :books, through: :meetings
	# has a wishlist
	# has many books through wishlist

end
