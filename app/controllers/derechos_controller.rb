class DerechosController < ApplicationController
	
	def show
		@derecho = Derecho.find(params[:id])
	end
	
	def new
		@tipo = Tipo.find(params[:id])
		@derecho = Derecho.new
		@derecho.tipo = @tipo
	end

	def create
		@derecho = Derecho.new(params[:derecho])
		if @derecho.save
			redirect_to(@derecho, :notice => 'Derecho was
successfully created.')
		else
			render :action => 'new'
		end
	end

	def edit
    @derecho = Derecho.find(params[:id])
  end

	def update
		@derecho = Derecho.find(params[:id])

		if @derecho.update_attributes(params[:derecho])
			redirect_to(@derecho, :notice => 'Derecho was successfully updated.')
		else
			render :action => 'edit'
		end
	end
	
end
