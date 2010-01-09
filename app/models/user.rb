class User < ActiveRecord::Base

  validates_uniqueness_of :name
  validates_uniqueness_of :password
  validates_uniqueness_of :email

  has_many :flags
  has_many :comments

end
