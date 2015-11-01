class CreateEventEntries < ActiveRecord::Migration
  def change
    create_table :event_entries do |t|
    	t.references :event
    	t.references :user
    	t.float :amount
      t.timestamps null: false
    end
  end
end
