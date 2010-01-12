class Comment < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :content
  validates_length_of :content, :maximum => 5000

  belongs_to :user
  belongs_to :topic
  belongs_to :fallacy
  belongs_to :flag

  acts_as_tree

end
