class SessionsController < ApplicationController

	def new
	end
	
	def create

		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You have been logged in"
			redirect_to user_path(user.username)
		else
			flash.now[:error] = "Something was wrong with your user id or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You logged out"
		redirect_to login_path
	end

end
