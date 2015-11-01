class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.string :location
    	t.text :desc
    	t.datetime :start_doe 
      t.datetime :end_doe
    	t.float :fee
      t.timestamps null: false
    end
  end
end
