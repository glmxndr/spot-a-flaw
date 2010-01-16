class Topic < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_length_of :origin, :within => 15..1000

  has_many :comments, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  has_many :fallacies, :through => :flags

end
