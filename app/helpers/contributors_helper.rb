module ContributorsHelper
  def diaspora_url(contributor)
    username, server = contributor.diaspora_id.split('@')
    "http://#{server}/u/#{username}"
  end
end
