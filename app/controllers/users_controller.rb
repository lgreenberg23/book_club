class UsersController < ApplicationController

	def index
		@users = User.all

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.group_id = params[:user][:group_id].to_i
		@user.save

		session[:user_id] = @user.id

		redirect_to user_path(@user)
	end

	def show
		@user = current_user
		@group = Group.find_by(id: @user.group_id)
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)

		redirect_to user_path(@user)
	end

	def destroy
		@user = current_user
		@user.destroy

		redirect_to users_path
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def current_user
			User.find(params[:id])
		end

end