class AddOtherFieldsToCompetitions < ActiveRecord::Migration
  def change
  	add_column :competitions, :category, :string
  	add_column :competitions, :moreDetails ,:text
    add_column :competitions, :location ,:string
    add_column :competitions, :onOff ,:string
    add_column :competitions, :linkWebsite ,:string
    add_column :competitions, :linkFb ,:string
    add_column :competitions, :organizedBy ,:string
    add_column :competitions, :startDateText,:text
    add_column :competitions, :endDateText,:text

    add_index :competitions, :category
  	add_index :competitions, :name
  end
end
