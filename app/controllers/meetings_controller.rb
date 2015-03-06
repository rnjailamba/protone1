class MeetingsController < ApplicationController
	before_action :authenticate_user!


	def create
		Rails.logger.info params[:attending_competition_id]

		Rails.logger.info params[:id]
		

		@comp  = Competition.find(params[:attending_competition_id])
		@meeting = current_user.meetings.build(:attending_competition_id => @comp.id)
		#current_user.meetings.create(params[:id])

		  if @meeting.save
		    flash[:notice] = "Registered."
		    
		  else
		    flash[:error] = "Unable to register."
		    
		  end

		  respond_to do |format|
			  format.html 
			  format.js
		  end
	end

	 def destroy
	    @comp  = current_user.meetings.find_by(params[:id]).attending_competition
	    Rails.logger.info @comp


	    current_user.meetings.find_by(params[:id]).destroy

	    redirect_to @comp
	  end
	

end