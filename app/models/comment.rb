class Comment < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_length_of :content, :maximum => 5000

  has_many :comments

end
