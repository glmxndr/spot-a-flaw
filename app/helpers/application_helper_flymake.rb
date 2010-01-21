# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def trunc(text, wordcount = 10)
    text.split[0..(wordcount-1)].join(" ") + (thought.split.size > wordcount ? "..." : "")
  end

  def truncurl(url)
    
  end

end
