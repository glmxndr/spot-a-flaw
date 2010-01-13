class Topic < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_length_of :origin, :within => 15..1000

  has_many :comments
  has_many :flags

end
