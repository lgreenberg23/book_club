require 'byebug'

class MeetingsController < ApplicationController

	def index
		@meetings = Meeting.all
		@user = current_user

		@meetings = @meetings.sort
		@future_meetings = []
		@past_meetings = []
		@meetings.each do |meeting|
			if meeting.time > Time.now
				@future_meetings << meeting
			else
				@past_meetings << meeting 
			end
		end
	end

	def new
		# if @user.meetings_attended >= 2
		@meeting = Meeting.new
		@meeting.book = Book.new
		@user = current_user
		# else, flash[:message] = "You need to read more books first."

	end

	def create
		# params = {
		#   'meeting': {
		#     time: '...',
		#     location: '...'       
		#     place: '...'       
		#     book_id: '...'       
		#     book: {
		#       title: '...',
		#       pages: '...'
		#     }      
	    #   }
		# }
	# byebug
		book = Book.new(book_params)
		@meeting = Meeting.new(meeting_params)
byebug
		if book.valid?
		  book.save
		  @meeting.book = book 
		end

		@user = current_user

		@meeting.group_id = @user.group_id
		# @meeting.book_id = params[:meeting][:book_id].to_i
		
		# This would be all of the members in the group
		# @meeting.users_meetings_id = params[:meeting][:users_meetings_id].to_i
		
		@meeting.save
		@user.meetings_attended
		 # byebug
		redirect_to meeting_path(@meeting)
	end

	def show
		# byebug
		@meeting = current_meeting
		@book = Book.find(@meeting.book_id)
		@users = User.all
		#this is an array of meeting_user instances?
		meeting_users = MeetingUser.all.select {|mtg_usr| mtg_usr.meeting_id == @meeting.id }
		#this is an array of user IDs
		attendees = meeting_users.collect {|mtg_user| mtg_user.user_id}
		#this should be an array of user instances
		@attendees = attendees.collect {|at| User.find(at)}
		@user = current_user
		@attended = attending_meeting?
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

	def attend
		@user = current_user
		@meeting = current_meeting
		MeetingUser.create(user: @user, meeting: @meeting)
		@book = Book.find(@meeting.book_id)
		@group = Group.find(@user.group_id)
	end

	def unattend
		@user = current_user
		@meeting = current_meeting
				# byebug
		instance = MeetingUser.find_by(user_id: @user.id)
		@instance = instance.select {|row| row.user_id == @user.id && row.meeting_id == @meeting.id }
		@instance.delete

		redirect_to meetings_path
	end


	private
	def meeting_params
		params.require(:meeting).permit(:time, :place, :book_id, :book)
	end

	def book_params
		byebug
		params.require(:meeting).require(:book).permit(:title, :author, :genre, :description, :length_in_pages)
	end

	def current_meeting
		Meeting.find(params[:id])
	end

	def current_user
		User.find_by(id: session[:user_id])
	end


	def attending_meeting?
		MeetingUser.select { |meeting| meeting.meeting_id == current_meeting.id && meeting.user_id == current_user.id }
	end

end