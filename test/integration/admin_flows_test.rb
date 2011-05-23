require 'test_helper'

class AdminFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

	test "login an admin" do
		#https!
		get "/admin_log_in"
		assert_response :success
		post_via_redirect "/admin_sessions", :login => admins(:one).login, :password => "cool"
		assert_equal "/home", path
	end

end
