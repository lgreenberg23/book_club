class Meeting < ApplicationRecord
	belongs_to :group
	belongs_to :book
	has_many :meeting_users
	has_many :users, through: :meeting_users

	def name 
		book = Book.find(self.book_id)
		"#{self.time.strftime("%b %d, %Y")} at #{self.time.strftime("%I %p")}, #{book.title}"
	end

end
