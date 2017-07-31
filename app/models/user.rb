class User < ApplicationRecord

	has_secure_password

	belongs_to :group
	has_many :users_meetings
	has_many :meetings, through: :users_meetings
	has_many :books, through: :meetings #can you do this?


end
