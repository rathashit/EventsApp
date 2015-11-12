class Event < ActiveRecord::Base
	has_many :event_entries
	has_many :users, :through => :event_entries, dependent: :delete_all
end
