class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_many :competitions     
	has_many :meetings , class_name:  "Meeting" ,foreign_key: "participant_id"
	has_many :attending_competitions, through: :meetings,:source => :attending_competition

  accepts_nested_attributes_for :meetings


end
