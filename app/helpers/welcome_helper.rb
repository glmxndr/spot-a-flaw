module WelcomeHelper

  def recent_topics
    Topic.find(:all, :order => "created_at DESC", :limit => 10)
  end

  def recent_fallacies
    Fallacy.find(:all, :order => "created_at DESC", :limit => 10)
  end

  def recent_flags
    Flag.find(:all, :order => "created_at DESC", :limit => 10)
  end

  def recent_comments
    Comment.find(:all, :order => "created_at DESC", :limit => 10)
  end

end
