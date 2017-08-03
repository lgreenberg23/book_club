require 'byebug'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :logged_in_user, :logged_in, :user_group, :user_wishlist

  def logged_in_user
     @logged_in_user ||= User.find_by(id: session[:user_id]) 
  end

  	def user_group
      if logged_in
        @user = logged_in_user
    		@user_group = Group.find(@user.group_id)
      end
  	end

    def user_wishlist
      group = user_group
      @wishlist = group.wishlist
    end

# => WORK ON THIS PLZ
	# def user_meeting
	#   @user = current_user
 #    @group = Group.find_by(id: @user.group_id)
 #    meeting_users = MeetingUser.all.select {|mtg_usr| mtg_usr.user_id == @user.id }
 #    #this is an array of user IDs
 #    meetings = meeting_users.collect {|mtg_user| mtg_user.meeting_id}
 #    #this should be an array of user instances
 #    @meetings = meetings.collect {|at| Meeting.find(at)}
	# end



  def logged_in
  	!!logged_in_user
  end

  
end
