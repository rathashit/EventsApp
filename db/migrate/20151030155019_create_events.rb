class CreateEvents < ActiveRecord::Migration
  def up
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
  def down
    drop_table :events
  end
end
