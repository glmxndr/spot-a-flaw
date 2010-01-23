class Fallacy < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_presence_of :shortname
  validates_uniqueness_of :shortname

  has_many :comments, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  has_many :topics, :through => :flags, :uniq => true

end
