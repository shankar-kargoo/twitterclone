class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Account Created"
			redirect_to user_path(@user.username)
		else
			render :new
		end
	end
	
	def show
		@user = User.find_by(username: params[:username])
	end

	private

	def user_params
		params.require(:user).permit!
	end

end
