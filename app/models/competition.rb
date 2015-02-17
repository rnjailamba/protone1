class Competition < ActiveRecord::Base

	searchkick

	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 50 }
	validates :startDateText,  presence: true
	validates :category,  presence: true

	belongs_to :user 
	has_many :meetings, class_name:  "Meeting", foreign_key: "attending_competition_id"
	has_many :participants, through: :meetings,:source => :participant


end
