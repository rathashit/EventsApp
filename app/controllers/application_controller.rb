class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_login
  	unless session[:email]
  		flash[:alert] = "Please log in"
  		redirect_to(:controller => 'events', :action => 'login' )
  		return false
  	else
  		return true
  	end
  end
end

def eventFee(user)
  user = User.where(:email => session[:email]).first
  event = Event.find(params[:event_id])
  if user.gender == "Female"
    fee = event.fee - event.fee*0.05
  else
    fee = event.fee
  end
end