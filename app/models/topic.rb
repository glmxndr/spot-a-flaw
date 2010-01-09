class Topic < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content

  has_many :comments
  has_many :flags

end
