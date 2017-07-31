class MeetingsController < ApplicationController

	def index
		@meetings = Meeting.all 
	end

	def new
		# if @user.meetings_attended >= 2
		@meeting = Meeting.new
		# else, flash[:message] = "You need to read more books first."

	end

	def create
		@meeting = Meeting.new(meeting_params)
		@meeting.group_id = params[:meeting][:group_id].to_i
		@meeting.book_id = params[:meeting][:book_id].to_i
		@meeting.users_meetings_id = params[:meeting][:users_meetings_id].to_i
		@meeting.save
		redirect_to meeting_path(@meeting)
	end

	def show
		@meeting = current_meeting
		@book = Book.find(@meeting.book_id)
		# @members = User.select() FIND THE USERS WHO ARE ASSOCIATED WITH THIS MEETING
	end

	def edit
		@meeting = current_meeting
	end

	def update
		@meeting = current_meeting
		@meeting.update(meeting_params)
		# search or create new book by name, add the book by id to the meeting
		redirect_to meeting_path(@meeting)
	end

	def destroy
		@meeting = current_meeting
		@meeting.destroy
		redirect_to meetings_path
		#do you want to redirect to all the meetings or back to the group show page?
	end


	private
	def meeting_params
		params.require(:meeting).permit(:time, :place)

	def current_meeting
		Meeting.find(params[:id])
	end

end