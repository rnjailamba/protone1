class AddEmailToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :email, :string
  end
end
