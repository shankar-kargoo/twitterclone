class StatusesController < ApplicationController

	before_action :require_user, onlyl: [:new, :create]

	def new
		@status = Status.new
	end

	def create
		@status = Status.new(status_params)
		@status.creator = current_user
		if @status.save
			flash[:notice] = "Status Created"
			redirect_to user_path(@status.creator.username)
		else
			flash[:errors]
			render :new
		end

	end

	private

	def status_params
		params.require(:status).permit(:body)
	end



end
