class AccessController < ApplicationController
  
  def login

  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
		user = User.where(:email => params[:email]).first

		if user
			attempt_user = user.authenticate(params[:password])			
		end
	end
	if attempt_user
		session[:email] = user.email
		flash[:notice] = "Logged in sucessfully"
		redirect_to ({:controller => 'events', :action => 'index'})
	else
		flash[:alert] = "Incorrect email/password combination"
		redirect_to(:action => 'login')
	end
  end

  def register
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Registration confirmed"
  		redirect_to(:action => 'index', :controller => 'events')
  	else
  		render('register')
  	end
  end

  def logout
    session[:email] = nil 
    flash[:notice] = "You have logged out successfully"
    redirect_to(:action => 'login')
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :gender, :password, :password_confirmation)
  end
end
