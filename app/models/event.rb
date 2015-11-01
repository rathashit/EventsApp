class Event < ActiveRecord::Base
	has_many :event_entries
	has_many :users, :through => :event_entries
end
