class AccionsController < ApplicationController
  # GET /accions
  # GET /accions.xml
  def index
    @accions = Accion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accions }
    end
  end

  # GET /accions/1
  # GET /accions/1.xml
  def show
    @accion = Accion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accion }
    end
  end

  # GET /accions/new
  # GET /accions/new.xml
  def new
    @accion = Accion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accion }
    end
  end

  # GET /accions/1/edit
  def edit
    @accion = Accion.find(params[:id])
  end

  # POST /accions
  # POST /accions.xml
  def create
    @accion = Accion.new(params[:accion])

    respond_to do |format|
      if @accion.save
        format.html { redirect_to(@accion, :notice => 'Accion was successfully created.') }
        format.xml  { render :xml => @accion, :status => :created, :location => @accion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accions/1
  # PUT /accions/1.xml
  def update
    @accion = Accion.find(params[:id])

    respond_to do |format|
      if @accion.update_attributes(params[:accion])
        format.html { redirect_to(@accion, :notice => 'Accion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accions/1
  # DELETE /accions/1.xml
  def destroy
    @accion = Accion.find(params[:id])
    @accion.destroy

    respond_to do |format|
      format.html { redirect_to(accions_url) }
      format.xml  { head :ok }
    end
  end
end
