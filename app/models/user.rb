class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_many :competitions     
	has_many :meetings
	has_many :attending_competitions, through: :meetings,foreign_key: "attending_competition_id"


end
