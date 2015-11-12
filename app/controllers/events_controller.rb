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
        @a_default = @n_default = @m_default = false
        if attend
          @status = attend.event_entries.where(:event => @event).first.status
          if @status == "yes"
            @a_default = true
          elsif @status == "no"
            @n_default = true
          elsif @status == "maybe"
            @m_default = true  
          end
        else
            @status = false
        end
      end
    end
    if @event.start_doe.strftime("%m/%d/%Y") == @event.end_doe.strftime("%m/%d/%Y")
      @date = @event.start_doe.strftime("%d %b %y").to_s
    else
      @date = @event.start_doe.strftime("%d") + "-" + @event.end_doe.strftime("%d %B %Y");
    end
  end

  def change_status
    @user = User.where(:email => session[:email]).first
    @event = Event.find(params[:event_id])
    entry = @user.event_entries.where(:event => @event).first
    if entry.present?
      entry.update(:status => params[:status])
    else
      EventEntry.create(:user => @user, :event => @event, :status => params[:status])
    end
    redirect_to(:action => 'view', :event_id => @event.id)
  end

end
