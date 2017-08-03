class User < ApplicationRecord

	has_secure_password
	acts_as_voter

	belongs_to :group
	has_many :meeting_users
	has_many :meetings, through: :meeting_users
	has_many :books, through: :meetings

	def meetings_attended
		count = MeetingUser.select { |meetinguser| meetinguser.user_id == self.id }
		count.length
	end


end
