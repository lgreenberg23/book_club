class User < ApplicationRecord

	has_secure_password
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "Input correctly formatted email"

	belongs_to :group
	has_many :meeting_users
	has_many :meetings, through: :meeting_users
	has_many :books, through: :meetings

	def meetings_attended
		count = MeetingUser.select { |meetinguser| meetinguser.user_id == self.id }
		count.length
	end


end
