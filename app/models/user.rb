class User < ActiveRecord::Base

  acts_as_authentic

  validates_uniqueness_of :name
  validates_uniqueness_of :email

  has_many :flags, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def self.admins
    User.find :all, :conditions => {:admin => true}
  end
  
  def self.notified_users
    User.find :all, :conditions => {:notified => true}
  end
  

end
