class EventsController < ApplicationController
  
  before_action :confirm_login, :except => [:index, :view] 

  def index
  	@events = Event.all.order('start_doe desc')
  end

  def view
  	@event = Event.find(params[:event_id])
    if session[:email].present?
      user = User.where(:email => session[:email]).first
      if @event.start_doe < Date.today
        @expired = true
      else
        @expired = false
        attend = user.events.where(:id => @event.id).first
        if attend
          @attending = true
        else
          @attending = false
        end
      end
    end
    if @event.start_doe.strftime("%m/%d/%Y") == @event.end_doe.strftime("%m/%d/%Y")
      @date = @event.start_doe.strftime("%d %b %y").to_s
    else
      @date = @event.start_doe.strftime("%d") + "-" + @event.end_doe.strftime("%d %B %Y");
    end
  end

  def confirm
    user = User.where(:email => session[:email]).first
    @event = Event.find(params[:event_id])
    @fee = eventFee(user)
  end
  def enroll
  	user = User.where(:email => session[:email]).first
  	event = Event.find(params[:event_id])
  	fee = eventFee(user)
  	EventEntry.create(:user => user, :event => event, :amount => fee)
  	flash[:notice] = "You have sucessfully enrolled for this event"
  	redirect_to(:action => 'view', :event_id => event.id)
  end

  def disenroll
  	user = User.where(:email => session[:email]).first
  	event = Event.find(params[:event_id])
  	entry = EventEntry.where(:user => user, :event => event).first
  	entry.destroy
  	flash[:notice] = "You have sucessfully disenrolled for this event"
  	redirect_to(:action => 'view', :event_id => event.id)
  end

end
