class SessionsController < ApplicationController

	def new
	end

	def create
		# byebug
		user = User.find_by(name: params[:user][:name])
		authenticated = user.try(:authenticate, params[:user][:password])
		if authenticated
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash[:message] = "Please try to login again"
			redirect_to login_path
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end