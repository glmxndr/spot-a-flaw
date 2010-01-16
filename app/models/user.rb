class User < ActiveRecord::Base

  acts_as_authentic

  validates_uniqueness_of :name
  validates_uniqueness_of :email

  has_many :flags, :dependent => :destroy
  has_many :comments, :dependent => :destroy

end
