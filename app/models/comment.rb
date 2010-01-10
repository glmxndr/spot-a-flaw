class Comment < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_length_of :content, :maximum => 5000

  belongs_to :user
  belongs_to :topic
  belongs_to :fallacy
  belongs_to :flag

  acts_as_tree


  # Retrieve the URL of the original content this comment line
  # is issued from
  def initial_content_url
    root_comment = self.root
    if root_comment.topic
      topic_url root_comment.topic
    elsif root_comment.fallacy
      fallacy_url root_comment.fallacy
    elsif root_comment.flag
      flag_url root_comment.flag
    end
    comment_url root_comment
  end

end
