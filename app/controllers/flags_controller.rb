class FlagsController < ApplicationController
  # GET /flags
  # GET /flags.xml
  def index
    unless admin_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end

    @flags = Flag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flags }
    end
  end

  # GET /flags/1
  # GET /flags/1.xml
  def show
    @flag = Flag.find(params[:id])
    @topic = @flag.topic
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flag }
    end
  end

  # GET /flags/1/edit
  def edit
    @flag = Flag.find(params[:id])
    unless can_edit_flag @flag
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end
  end

  # POST /flags
  # POST /flags.xml
  def create
    unless enabled_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end

    @flag = Flag.new(params[:flag])
    @flag.user_id = current_user.id

    respond_to do |format|
      if @flag.save
        flash[:notice] = 'Flag was successfully created.'
        format.html { redirect_to(@flag) }
        format.xml  { render :xml => @flag, :status => :created, :location => @flag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flags/1
  # PUT /flags/1.xml
  def update
    @flag = Flag.find(params[:id])
    unless can_edit_flag(@flag)
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end

    respond_to do |format|
      if @flag.update_attributes(params[:flag])
        flash[:notice] = 'Flag was successfully updated.'
        format.html { redirect_to(@flag) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flags/1
  # DELETE /flags/1.xml
  def destroy
    @flag = Flag.find(params[:id])
    unless can_edit_flag @flag
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end


    @flag.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.xml  { head :ok }
    end
  end
end
