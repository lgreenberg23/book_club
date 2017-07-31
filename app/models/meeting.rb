class Meeting < ApplicationRecord
	belongs_to :group
	belongs_to :book
	has_many :users_meetings
	has_many :members, through: :users_meetings

	def name 
		book = Book.find(self.book_id)
		"#{self.time}, #{book}"
	end

end
