require 'byebug'

class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new 
		@group = Group.new
	end

	def create 
		@group = Group.create(group_params)
		@wishlist = Wishlist.create(group_id: @group.id)
		redirect_to new_admin_path
	end

	def show
		@group = current_group
		@user = current_user
		users = User.all
		@group_users = users.select {|user| user.group_id == @group.id}
	end

	def edit
		@group = current_group
	end

	def update
		@group = current_group
		@group.update(group_params)

		redirect_to group_path(@group)
	end

	def destroy
		@group = current_group
		@group.destroy

		redirect_to groups_path
	end




	private
	def group_params
		params.require(:group).permit(:name, :size, :frequency_of_meeting, :genres_read)
	end

	def current_group
		Group.find(params[:id])
	end

	def current_user
		User.find_by(id: session[:user_id])
	end

end