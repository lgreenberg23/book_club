class Book < ApplicationRecord

	has_many :meetings
	has_many :meeting_users, through: :meetings
	has_many :users, through: :meeting_users
	has_many :groups, through: :meetings 
	
	# has many wish_lists
end
