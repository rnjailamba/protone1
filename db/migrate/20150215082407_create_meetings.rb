class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

      t.integer :participant_id
      t.integer :attending_competition_id
      t.timestamps null: false
    end

    add_index :meetings, :participant_id
    add_index :meetings, :attending_competition_id

  end
end
