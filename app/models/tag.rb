class Tag < ActiveRecord::Base

  has_many :taggings, :dependent => :destroy
  has_many :topics, :through => :taggings, :uniq => true

  def count
    self.taggings.size
  end

end
