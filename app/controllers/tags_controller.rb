class TagsController < ApplicationController

  def index
    @tags = Tag.find(:all, :order => 'name').reject {|tag| tag.count == 0}

    respond_to do |format|
      format.html
      format.xml  { render :xml => @topics }
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @topics = @tag.topics
    respond_to do |format|
      format.html
      format.xml  { render :xml => @topic }
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    unless admin_user
      flash[:error] = 'Forbidden action.'
      redirect_to root_url
    end

    @tag.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.xml  { head :ok }
    end
  end


end
