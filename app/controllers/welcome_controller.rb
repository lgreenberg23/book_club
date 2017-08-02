class WelcomeController < ApplicationController

	def index
		if !logged_in
			render :index
		else
			redirect_to group_path(user_group)
		end
	end

end