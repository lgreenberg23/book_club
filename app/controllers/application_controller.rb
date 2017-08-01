class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_filter :login_check

  helper_method :login_check

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  	def group
  		@group = Group.find(@current_user.group_id)
  	end


	def current_meeting
		Meeting.find(params[:id])
	end


  def login_check
  	!!current_user
  end

  
end
