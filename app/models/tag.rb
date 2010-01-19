class Tag < ActiveRecord::Base

  has_many :taggings, :dependent => :destroy
  has_many :topics, :through => :taggings

  def count
    self.taggings.size
  end

end
