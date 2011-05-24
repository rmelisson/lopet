require 'test_helper'

class DerechoTest < ActiveSupport::TestCase

	test "should not save derecho without a tipo" do
		derecho = Derecho.new
		derecho.title = "blabla"
		assert !derecho.save, "Save a derecho without a tipo"
	end

	test "should not save derecho without a title" do
		derecho = Derecho.new
		derecho.tipo_id = tipos(:one) 
		assert !derecho.save, "Save a derecho without a title"
	end

end
