class Topic < ActiveRecord::Base

  validates_length_of :title, :within => 15..255
  validates_presence_of :content
  validates_length_of :origin, :within => 15..1000

  has_many :comments, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  has_many :fallacies, :through => :flags

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_writer :topic_tags
  after_save :assign_tags

  def topic_tags
    @topic_tags || tags.map(&:name).join(' ')
  end

  private

  def assign_tags
    self.taggings.each do |tagging|
      tagging.destroy
    end
    if @topic_tags
      self.tags = @topic_tags.tr(',;|()[]{}<>&./\\=$%@1?`~',' ').downcase().split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

end
