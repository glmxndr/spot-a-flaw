module CommentsHelper

  # Retrieve the URL of the original content this comment line
  # is issued from
  def initial_content_url(comment)
    root = comment.root
    logger.debug "#######################\n"
    logger.debug root.attributes
    logger.debug "\n\n\n\n\n"
    if root.topic
      return topic_url root.topic
    elsif root.fallacy
      return fallacy_url root.fallacy
    elsif root.flag
      return flag_url root.flag
    end
    comment_url root
  end

end
