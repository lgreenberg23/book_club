class Group < ApplicationRecord

	validates :name, uniqueness: true
	validates :frequency_of_meeting, presence: true
	validates :genres_read, presence: true
	validates :size, presence: true

	has_many :users
	has_many :meetings
	has_many :books, through: :meetings
	# has a wishlist
	# has many books through wishlist

end
