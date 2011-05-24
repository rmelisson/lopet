require 'test_helper'

class TipoTest < ActiveSupport::TestCase


	test "should not save tipo without title" do
		tipo = Tipo.new
		assert !tipo.save, "Save a tipo without title"
	end

	test "should be able to save a tipo with a title" do
		tipo = Tipo.new
		tipo.title = "blablabla"
		assert tipo.save, "Save a standard tipo"
	end

end
