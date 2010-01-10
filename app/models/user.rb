class User < ActiveRecord::Base

  acts_as_authentic

  validates_uniqueness_of :name
  validates_uniqueness_of :email

  has_many :flags
  has_many :comments

end
