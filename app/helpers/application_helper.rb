module ApplicationHelper
  include I18nHelper
  def page_title title, suffix = t(:title)
    if title.blank? || title =~ /home/i
      suffix
    else
      "#{title} - #{suffix}"
    end
  end
end
