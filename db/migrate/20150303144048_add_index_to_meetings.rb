class AddIndexToMeetings < ActiveRecord::Migration
  def change

  	add_index :meetings, [:participant_id,:attending_competition_id], unique: true      
  end
end
