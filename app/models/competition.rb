class Competition < ActiveRecord::Base

	belongs_to :user 
	has_many :meetings, class_name:  "Meeting", foreign_key: "attending_competition_id"
	has_many :participants, through: :meetings,:source => :participant


end
