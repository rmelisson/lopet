class AutoridadsController < ApplicationController
  # GET /autoridads
  # GET /autoridads.xml
  def index
    @autoridads = Autoridad.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @autoridads }
    end
  end

  # GET /autoridads/1
  # GET /autoridads/1.xml
  def show
    @autoridad = Autoridad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @autoridad }
    end
  end

  # GET /autoridads/new
  # GET /autoridads/new.xml
  def new
    @autoridad = Autoridad.new
    @juezs = Juez.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @autoridad }
    end
  end

  # GET /autoridads/1/edit
  def edit
    @autoridad = Autoridad.find(params[:id])
    @juezs = Juez.all
  end

  # POST /autoridads
  # POST /autoridads.xml
  def create
    @autoridad = Autoridad.new(params[:autoridad])

    respond_to do |format|
      if @autoridad.save
        format.html { redirect_to(@autoridad, :notice => 'Autoridad was successfully created.') }
        format.xml  { render :xml => @autoridad, :status => :created, :location => @autoridad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @autoridad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /autoridads/1
  # PUT /autoridads/1.xml
  def update
    @autoridad = Autoridad.find(params[:id])

    respond_to do |format|
      if @autoridad.update_attributes(params[:autoridad])
        format.html { redirect_to(@autoridad, :notice => 'Autoridad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @autoridad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /autoridads/1
  # DELETE /autoridads/1.xml
  def destroy
    @autoridad = Autoridad.find(params[:id])
    @autoridad.destroy

    respond_to do |format|
      format.html { redirect_to(autoridads_url) }
      format.xml  { head :ok }
    end
  end
end
