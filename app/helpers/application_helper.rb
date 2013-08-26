module ApplicationHelper
  def page_title title, suffix = t(:title)
    if title.blank? || title =~ /home/i
      suffix
    else
      "#{title} - #{suffix}"
    end
  end

  def markdownify text
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true).render(text).html_safe
  end
end
