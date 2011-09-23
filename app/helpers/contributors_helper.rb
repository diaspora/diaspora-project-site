module ContributorsHelper
  def diaspora_url(contributor)
    username, server = contributor.diaspora_id.split('@')
    "http://#{server}/u/#{username}"
  end

  def contributor_type(type)
    case type
    when 'hacker'
      'Hackers'
    when 'painter'
      'Painters'
    when 'community'
      'Community Members'
    else
      'Other'
    end
  end

  def contributor_type_description(type)
    case type
    when 'hacker'
      "Coders, hackers, programmers;  whatever you call them, they are the people who make Diaspora*, fast, reliable and secure."
    when 'painter'
      "They make Diaspora* beautiful."
    when 'community'
      "The people are responsible for the friendly face of Diaspora*"
    else
      'Because they are awesome'
    end
  end
end
