class UsersController < ActionController::Base

def attending_competitions
	if current_user
      @comp = current_user.attending_competitions
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
   end
	
end

def created_competitions
	if current_user
      @comp = current_user.competitions
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
   end
end

end