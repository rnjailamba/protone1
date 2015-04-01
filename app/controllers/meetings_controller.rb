class MeetingsController < ApplicationController
	before_action :authenticate_user! , except: [:register]


	def create
		#Rails.logger.info params[:attending_competition_id]

		#Rails.logger.info params[:id]
		

		@competition  = Competition.find(params[:attending_competition_id])
		@meeting = current_user.meetings.build(:attending_competition_id => @competition.id)
		#current_user.meetings.create(params[:id])

		  if @meeting.save
		    flash[:notice] = "Registered."
		    
		  else
		    flash[:error] = "Unable to register."
		    
		  end

		  respond_to do |format|
			  format.html { redirect_to @competition }
			  format.js
		  end
	end

	 def destroy

	 	#Rails.logger.info "The Params ID"
	    #Rails.logger.info params[:id]
	    @competition  =Meeting.find(params[:id]).attending_competition
	     Meeting.find(params[:id]).destroy
	    
	    #Rails.logger.info "The ID"
	    #Rails.logger.info @competition.id


	    
	     respond_to do |format|
			  format.html { redirect_to @competition }
			  format.js
		  end
	    
	  end

	  def register
	  	@competition  = Competition.find(params[:attending_competition_id])
	  	@meeting = Meeting.create(:attending_competition_id => @competition.id,email: params[:todo_text])
		#current_user.meetings.create(params[:id])
		respond_to do |format|
			  format.html { redirect_to @competition }
			  format.js
		  end
	  end


	  private

	  def meeting_params
        params.require(:meeting).permit(:email,:attending_competition,:participant)
   	  end
	

end