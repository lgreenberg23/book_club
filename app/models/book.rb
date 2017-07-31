class Book < ApplicationRecord

	has_many :meetings
	has_many :users, through: :meetings
	# has many wish_lists
end
