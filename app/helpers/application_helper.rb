module ApplicationHelper
  def page_title(title, suffix = t(:title))
    if title.blank? or title =~ /home/i
      return suffix
    else
      return "#{title} - #{suffix}"
    end
  end
end
