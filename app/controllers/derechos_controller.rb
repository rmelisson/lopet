class DerechosController < ApplicationController
	
	def view
		@derecho = Derecho.find(params[:id])
	end
	
end
