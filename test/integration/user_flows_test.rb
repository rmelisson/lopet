require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "connect a user" do
		get "/"	
		assert_response :success
		post_via_redirect "/sessions", :email => users(:one).email, :password => "cool"
		assert_equal "/home", path
  end

end
