class MeetingsController < ApplicationController
	before_action :authenticate_user!


	def create
		Rails.logger.info params[:attending_competition_id]
		Rails.logger.info @comp

		@comp  = Competition.find(params[:attending_competition_id])
		@meeting = current_user.meetings.build(:attending_competition_id => @comp.id)
		
		  if @meeting.save
		    flash[:notice] = "Added friend."
		    redirect_to root_url
		  else
		    flash[:error] = "Unable to add friend."
		    redirect_to root_url
		  end
	end

	 def destroy
	    @comp  = Competition.find(params[:attending_competition_id])
	    current_user.meetings.find_by(@comp.id).destroy
	  end
	

end


