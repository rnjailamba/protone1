class Meeting < ActiveRecord::Base

	belongs_to :participant, class_name: "User"
	belongs_to :attending_competition, class_name: "Competition"

end
