class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    if current_user == nil or not current_user.admin
        flash[:error] = "You can't list the user profiles"
        redirect_to root_url
        return
    end
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if !allow_edit(current_user,params[:id].to_i)
      flash[:error] = "You can't view this profile"
      redirect_to root_url
      return
    end

    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if current_user != nil
      flash[:error] = "You must logout before signing up with another account"
      redirect_to root_url
      return
    end


    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit

    if params[:id]=='current'
      @user = current_user
    else
      if !allow_edit(current_user,params[:id].to_i)
        flash[:error] = "You can't edit this profile"
        redirect_to root_url
        return
      end
      @user = User.find(params[:id])
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.enabled = true
    @user.admin = false
    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end


  private

  ##
  # defines if the given user can edit the user with given id
  # @param pUser  a User instance, wanting to edit user with ID pId
  # @param pId    the ID of the user to be edited by pUser
  def allow_edit(user,id)
    if user == nil
      return false
    elsif user.admin
      return true
    elsif user.id == id.to_i
      return true
    else
      return false
    end
    #user == nil or (user.id != id.to_i and not user.admin)
  end

end
