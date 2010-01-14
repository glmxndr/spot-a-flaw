class Fallacy < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_presence_of :shortname

  has_many :comments
  has_many :flags
  has_many :topics, :through => :flags

end
