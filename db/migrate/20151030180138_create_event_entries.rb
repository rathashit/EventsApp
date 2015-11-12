class CreateEventEntries < ActiveRecord::Migration
  def up
    create_table :event_entries, :id  => false do |t|
      t.references :event, index: true
    	t.references :user, index: true
    	t.float :amount
      t.string :status
      t.timestamps null: false
    end
    add_index :event_entries, [:event_id, :user_id]
  end
  def down
  	drop_table :event_entries
  end
end
