class FallaciesController < ApplicationController
  # GET /fallacies
  # GET /fallacies.xml
  def index
    @fallacies = Fallacy.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fallacies }
    end
  end

  # GET /fallacies/1
  # GET /fallacies/1.xml
  def show
    @fallacy = Fallacy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fallacy }
    end
  end

  # GET /fallacies/new
  # GET /fallacies/new.xml
  def new
    unless enabled_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end
    @fallacy = Fallacy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fallacy }
    end
  end

  # GET /fallacies/1/edit
  def edit
    unless enabled_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end
    @fallacy = Fallacy.find(params[:id])
  end

  # POST /fallacies
  # POST /fallacies.xml
  def create
    unless enabled_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end
    @fallacy = Fallacy.new(params[:fallacy])

    respond_to do |format|
      if @fallacy.save
        flash[:notice] = 'Fallacy was successfully created.'
        format.html { redirect_to(@fallacy) }
        format.xml  { render :xml => @fallacy, :status => :created, :location => @fallacy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fallacy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fallacies/1
  # PUT /fallacies/1.xml
  def update
    unless enabled_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end
    @fallacy = Fallacy.find(params[:id])

    respond_to do |format|
      if @fallacy.update_attributes(params[:fallacy])
        flash[:notice] = 'Fallacy was successfully updated.'
        format.html { redirect_to(@fallacy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fallacy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fallacies/1
  # DELETE /fallacies/1.xml
  def destroy
    unless admin_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end

    @fallacy = Fallacy.find(params[:id])
    @fallacy.destroy

    respond_to do |format|
      format.html { redirect_to(fallacies_url) }
      format.xml  { head :ok }
    end
  end
end
