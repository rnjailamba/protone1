class Competition < ActiveRecord::Base

	belongs_to :user 
	has_many :meetings
	has_many :participants, through: :meetings,foreign_key: "participant_id"


end
