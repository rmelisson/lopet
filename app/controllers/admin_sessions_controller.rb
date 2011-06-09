class AdminSessionsController < ApplicationController
	
	def create
		admin = Admin.authenticate(params[:login], params[:password])
		if admin
			session[:admin_id] = admin.id
			redirect_to tipos_path, :notice => "Logged in!"
		else
			flash[:alert] = "Invalid login or password"
			redirect_to root_url
		end
	end

	def destroy
		session[:admin_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
