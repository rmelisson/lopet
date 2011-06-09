class SessionsController < ApplicationController
	
	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to tipos_path, :notice => "Logged in!"
		else
			flash[:alert] = "Invalid email or password"
			redirect_to root_url
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
