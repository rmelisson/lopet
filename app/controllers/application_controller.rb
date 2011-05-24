class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user
	helper_method :admin

	helper_method :is_admin
	helper_method :user_auth

	private
	
	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def admin
  	@admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def is_admin 
		unless session[:admin_id] 
			flash[:error] = "It's not your business"
			redirect_to root_url
			return false
		end
	end
	
	def is_user 
		unless session[:user_id] 
			flash[:error] = "You have to be connected"
			redirect_to root_url
			return false
		end
	end

end
