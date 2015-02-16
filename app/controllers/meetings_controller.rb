class MeetingsController < ApplicationController
	before_action :authenticate_user!

	def create
		Rails.logger.info "message"
		@comp  = Competition.find(params[:attending_competition_id])
		Rails.logger.info @comp
		Rails.logger.info "blah"
		@meeting = current_user.meetings.build(:attending_competition_id => 9)
		
	  if @meeting.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	  else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	  end
	end

	def destroy
	 
	end


end


