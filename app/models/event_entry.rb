class EventEntry < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	self.primary_keys = [:event_id, :user_id] 
	before_create :eventFee
	before_update :eventFee


	def eventFee
	  if status == "yes"
	  	if user.gender == "Female"
		  self.amount = event.fee - event.fee*0.05
		else
		  self.amount = event.fee
		end
	  else
	  	self.amount = 0.0
	  end
	end
end
