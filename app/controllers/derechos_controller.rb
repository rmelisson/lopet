class DerechosController < ApplicationController
	
	def show
		@derecho = Derecho.find(params[:id])
	end
	
	def new
		@tipo = Tipo.find(params[:id])
		@tipo.derechos.build()
	end

	def create
		@tipo = Tipo.find(params[:tipo_id])
		@derecho = @tipo.derechos.create(params[:derecho])

		if @derecho.save
			@derecho.save
			redirect_to(tipos_path, :notice => 'Derecho was
successfully created.')
		else
			render :action => 'new', :status => @derecho.errors
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
