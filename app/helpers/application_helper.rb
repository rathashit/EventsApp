module ApplicationHelper
	def logged_in
		if session[:email].present?
			true
		else
			false
		end
	end
end
